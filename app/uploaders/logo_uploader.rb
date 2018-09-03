class LogoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_fill: [200, 200]
  end

  version :small_thumb, from_version: :thumb do
    process resize_to_fill: [50, 50]
  end

  def default_url(*args)
    versioned_file_name = [version_name, Config::DefaultLogoFileName].compact.join('_')
    ActionController::Base.helpers.asset_path(versioned_file_name)
  end

  def extension_whitelist
    Config::ValidImageExtensions
  end
end
