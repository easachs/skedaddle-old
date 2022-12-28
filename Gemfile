# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap', '~>4.3.1'
gem 'coffee-rails', '~> 4.2'
gem 'dotenv-rails'
gem 'faraday'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'omniauth-rails_csrf_protection'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '>= 4.3.12'
gem 'rails', '~> 5.2.6'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'capybara'
  gem 'faker'
  gem 'figaro'
  gem 'pry'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'factory_bot'
  gem 'launchy'
  gem 'orderly'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'simplecov'
  gem 'vcr'
  gem 'webmock'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
