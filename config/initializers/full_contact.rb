FullContact.configure do |config|
  config.api_key = ENV['FULL_CONTACT_API_KEY']
  config.auth_type = :header
end
