class Capture < ActiveRecord::Base
  attr_accessible :page_source, :screenshot, :site_id
  belongs_to :site

  before_create :set_time_fragments
  after_create :scrape

  mount_uploader :screenshot, ScreenshotUploader
  mount_uploader :page_source, PageSourceUploader

  def to_param
    "#{id}-#{year_captured}-#{month_captured}-#{day_captured}-#{hour_captured}"
  end

  def site_name
    "#{site.name}"
  end

  def capture_datetime
    "#{created_at.strftime("%A %B %e, %Y at %l%p %Z")}"
  end

  def show_url
    "/#{year_captured}-#{month_captured}-#{day_captured}-#{hour_captured}/#{site.seo_name}/#{id}"
  end

  def previous_hour
    by_hour(created_at - 1.hour)
  end

  def next_hour
    by_hour(created_at + 1.hour)
  end

  def by_hour(hour)
    site.captures.where(:year_captured => hour.year).
                  where(:month_captured => hour.month).
                  where(:day_captured => hour.day).
                  where(:hour_captured => hour.hour).
                  where(["id <> ?", id]).
                  first
  end

private
  def set_time_fragments
    self.year_captured  = Time.now.year
    self.month_captured = Time.now.month
    self.day_captured   = Time.now.day
    self.hour_captured  = Time.now.hour
  end

  def scrape
    uuid = UUID.new.generate
    `phantomjs ./script/rasterize.js #{site.url} #{uuid}.png #{uuid}.html`
    self.screenshot = File.open(File.join(Rails.root, "#{uuid}.png"))
    self.page_source = File.open(File.join(Rails.root, "#{uuid}.html"))
    save

    File.delete(File.join(Rails.root, "#{uuid}.png"))
    File.delete(File.join(Rails.root, "#{uuid}.html"))

  end
end
