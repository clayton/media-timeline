json.array!(@sites) do |json, site|
  json.extract! site, :name, :url
  json.latest_capture site.latest_capture_thumbnail
end