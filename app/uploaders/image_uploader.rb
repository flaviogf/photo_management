# frozen_string_literal: true

class ImageUploader < Shrine
  plugin :determine_mime_type
end
