# frozen_string_literal: true

Rails.application.routes.draw do
  resources :photos

  mount Shrine.upload_endpoint(:cache) => '/upload'
end
