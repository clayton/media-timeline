CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => '088EVA1PZZCBZXF5GJG2',
    :aws_secret_access_key  => 'BuOmpNO/cLPOGzPz+wH84IKxjdcDskT2StM87Frn'
  }
  config.fog_directory  = "media-timeline-#{Rails.env.downcase}"
end