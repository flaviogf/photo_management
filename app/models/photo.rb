# frozen_string_literal: true

class Photo < ApplicationRecord
  include ImageUploader::Attachment(:image)

  validates :name, presence: true

  validates :image, presence: true

  validates :opened_at, presence: true
end
