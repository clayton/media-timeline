class Site < ActiveRecord::Base
  attr_accessible :affiliation, :name, :url
  has_many :captures

  def to_param
    "#{id}-#{seo_name}"
  end

  def seo_name
    name.downcase.gsub(/\s/, "-").gsub(/\//,"-")
  end

  def latest_capture_thumbnail
    latest_capture = captures.last
    return "" if latest_capture.blank?
    latest_capture.screenshot_url(:thumb)
  end
end
