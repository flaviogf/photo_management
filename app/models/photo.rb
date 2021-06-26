# frozen_string_literal: true

class Photo < ApplicationRecord
  enum ext: %i[png jpg]

  validates :name, presence: true

  validates :ext, presence: true

  validates :size, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :opened_at, presence: true
end
