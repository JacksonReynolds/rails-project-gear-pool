Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth_2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
  end