OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  configure do |config|
      config.path_prefix = '/auth'
    end
  provider :facebook, '517661271629948', 'ef3cdb5c0a80b16de7cfb335a68b0850'
  provider :twitter, 'vtu50pyEbc98mOIToadGYg', 'twiqzRYz4XBNbB01CL3KEIUHMYxXs9NAhcuRVdHHYg'
end