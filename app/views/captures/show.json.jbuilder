json.id @capture.id
json.site_name @capture.site_name
json.screenshot_url @capture.screenshot_url
json.thumbnail_url @capture.screenshot_url(:thumb)
json.capture_datetime @capture.capture_datetime
json.site_name @capture.site_name
json.next_hour do |next_hour|
  next_hour.thumbnail_url @capture.next_hour.screenshot_url(:thumb)
  next_hour.show_url @capture.next_hour.show_url
end
json.previous_hour do |previous_hour|
  previous_hour.thumbnail_url @capture.previous_hour.screenshot_url(:thumb)
  previous_hour.show_url @capture.previous_hour.show_url
end
