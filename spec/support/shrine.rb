# frozen_string_literal: true

module ShrineSupport
  module_function

  def image_data
    attacher = Shrine::Attacher.new

    attacher.set(uploaded_image)

    attacher.column_data
  end

  def image_json
    cached_image.to_json
  end

  def uploaded_image
    File.open('spec/fixtures/files/sample.png', binmode: true) do |file|
      uploaded_file = Shrine.upload(file, :store, metadata: false)

      uploaded_file.metadata.merge!(
        'size' => File.size(file.path),
        'mime_type' => 'image/png',
        'filename' => 'sample.png'
      )

      uploaded_file
    end
  end

  def cached_image
    File.open('spec/fixtures/files/sample.png', binmode: true) do |file|
      cached_file = Shrine.upload(file, :cache, metadata: false)

      cached_file.metadata.merge!(
        'size' => File.size(file.path),
        'mime_type' => 'image/png',
        'filename' => 'sample.png'
      )

      cached_file
    end
  end
end
