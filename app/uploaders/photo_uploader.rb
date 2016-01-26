class PhotoUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include Cloudinary::CarrierWave
  # include CarrierWave::MiniMagick

  process resize_to_fit: [200, 200]

  # Choose what kind of storage to use for this uploader:
  # storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  #  def store_dir
  #  "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  #  end

  def default_url
   'http://res.cloudinary.com/dhtx494no/image/upload/v1453823407/xwqiraah48rkjd1mpv21.png'
  end

  def default_public_id
    'headshot'
  end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fill => [30, 30]
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
