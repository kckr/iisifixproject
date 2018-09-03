class CoverUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    Config::ValidImageExtensions
  end

  def default_url(*args)
    versioned_file_name = [version_name, Config::DefaultCoverFileName].compact.join('_')
    ActionController::Base.helpers.asset_path(versioned_file_name)
  end
end
