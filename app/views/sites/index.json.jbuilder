json.datetime @current_datetime.to_s
json.pretty_date @current_datetime.strftime("%B %d, %Y")
json.hour @current_datetime.strftime("%l%p")

json.sites @sites do |json, site|
  json.extract! site, :name, :url
  json.latest_capture site.latest_capture_thumbnail
end