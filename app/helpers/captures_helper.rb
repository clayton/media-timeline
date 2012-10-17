module CapturesHelper
  def capture_url_params(capture)
    {
      :year  => capture.year_captured,
      :month => capture.month_captured,
      :day   => capture.day_captured,
      :hour  => capture.hour_captured
    }
  end
end
