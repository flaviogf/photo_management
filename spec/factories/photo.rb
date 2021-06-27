# frozen_string_literal: true

FactoryBot.define do
  factory :photo do
    name { 'image1.png' }
    image do
      '{"id":"590fed5bbc86f4f9b829b31a2fc723fe.png","storage":"cache","metadata":{"filename":"Wallpaper.png","size":126196,"mime_type":"image/png"}}'
    end
    opened_at { Time.now.utc }
  end
end
