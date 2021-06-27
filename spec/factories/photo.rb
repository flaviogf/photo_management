# frozen_string_literal: true

FactoryBot.define do
  factory :photo do
    name { 'image1.png' }
    image_data { ShrineSupport.image_data }
    opened_at { Time.now.utc }
  end
end
