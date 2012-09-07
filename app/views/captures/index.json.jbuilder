json.array!(@captures) do |json, grouped_captures|
  json.date grouped_captures.first
  json.captures grouped_captures.last do |json, capture|
    json.screenshot_src capture.screenshot.url(:thumb)
    json.site_name capture.site.name
    json.hour_captured capture.hour_captured
  end
end