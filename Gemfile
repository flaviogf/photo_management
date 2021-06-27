# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

gem 'bootsnap', '~> 1.4.4'
gem 'jbuilder', '~> 2.7'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4'
gem 'sass-rails', '~> 6'
gem 'shrine', '~> 3.4'
gem 'sqlite3', '~> 1.4'
gem 'turbolinks', '~> 5'
gem 'tzinfo-data', '~> 1.2021', platforms: %i[mingw mswin x64_mingw jruby]
gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'byebug', '~> 11.1.3', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.2.0'
  gem 'pry', '~> 0.13.0'
  gem 'pry-byebug', '~> 3.9.0'
  gem 'rails-controller-testing', '~> 1.0.5'
  gem 'rexml', '~> 3.2.5'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'shoulda-matchers', '~> 5.0.0.rc1'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring', '~> 2.1.1'
  gem 'web-console', '~> 4.1.0'
end

group :test do
  gem 'capybara', '~> 3.26'
  gem 'selenium-webdriver', '~> 3.142.7'
  gem 'webdrivers', '~> 4.6.0'
end
