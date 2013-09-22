source 'https://rubygems.org'
ruby '1.9.3'

gem 'devise'
gem 'haml-rails'
gem 'jquery-rails'
gem 'rails', '3.2.14'
gem 'simple_form'
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
  gem 'coffee-rails', '~> 3.2.1'
  gem 'less-rails' #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem 'sass-rails',   '~> 3.2.3'
  gem 'therubyracer'
  gem 'twitter-bootstrap-rails'
  gem 'uglifier', '>= 1.0.3'
end

group :test do
  gem 'capybara'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'rspec-rails'
end