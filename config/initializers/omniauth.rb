OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  configure do |config|
      config.path_prefix = '/auth'
    end
  provider :twitter, 'vtu50pyEbc98mOIToadGYg', 'twiqzRYz4XBNbB01CL3KEIUHMYxXs9NAhcuRVdHHYg'
end