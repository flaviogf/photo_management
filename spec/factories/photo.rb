# frozen_string_literal: true

FactoryBot.define do
  factory :photo do
    name { 'image1.png' }
    ext { :png }
    size { 1000 }
    opened_at { Time.now.utc }
  end
end
