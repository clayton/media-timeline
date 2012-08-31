json.array!(@captures) do |json, capture|
  json.screenshot_src capture.screenshot.url(:thumb)
  json.site_name capture.site.name
  json.hour_captured capture.hour_captured
end