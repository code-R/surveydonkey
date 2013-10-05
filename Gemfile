source 'https://rubygems.org'
ruby '1.9.3'

gem 'ancestry'
gem 'cancan'
gem 'devise'
gem 'draper'
gem 'haml-rails'
gem 'jquery-rails'
gem 'mab'
gem 'rails', '3.2.14'
gem 'simple_form'

group :development, :test do
  gem 'pry'
  gem 'sqlite3'
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
  gem 'jquery-ui-rails'
end

group :test do
  gem 'capybara'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner', '< 1.1.0'
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end