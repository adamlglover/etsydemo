CarrierWave.configure do |config|
  config.dropbox_app_key = "d7i5qjahym0c2yj"
  config.dropbox_app_secret = ENV["APP_SECRET"]
  config.dropbox_access_token = "pzdtlzoa50nwbica"
  config.dropbox_access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
  config.dropbox_user_id = "88984678"
  config.dropbox_access_type = "app_folder"
end