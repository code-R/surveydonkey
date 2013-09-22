source 'https://rubygems.org'
ruby '1.9.3'

gem 'devise'
gem 'haml-rails'
gem 'jquery-rails'
gem 'rails', '3.2.14'
gem 'sqlite3'

group :development, :test do
  gem 'pry'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'quiet_assets'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :test do
  gem 'capybara'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'rspec-rails'
end