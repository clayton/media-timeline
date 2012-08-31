class Capture < ActiveRecord::Base
  attr_accessible :page_source, :screenshot, :site_id
  belongs_to :site

  before_create :set_time_fragments
  after_create :scrape

  mount_uploader :screenshot, ScreenshotUploader
  mount_uploader :page_source, PageSourceUploader

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
