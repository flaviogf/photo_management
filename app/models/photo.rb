# frozen_string_literal: true

class Photo < ApplicationRecord
  enum type: %i[png jpg]

  validates :name, presence: true

  validates :type, presence: true

  validates :size, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :opened_at, presence: true
end
