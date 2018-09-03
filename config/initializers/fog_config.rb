CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                               # required
  config.fog_credentials = {
      provider:              'AWS',                             # required
      aws_access_key_id:     ENV['aws_access_key_id'],          # required
      aws_secret_access_key: ENV['aws_secret_access_key'],      # required
      region:                'eu-west-1',                       # optional, defaults to 'us-east-1'
      # host:                  's3.example.com',                  # optional, defaults to nil
      # endpoint:              'https://cloudformation.eu-west-1.amazonaws.com'      # optional, defaults to nil
  }
  config.fog_directory  = 'iisifix'                             # required
  # config.fog_public     = false                                 # optional, defaults to true

  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end
