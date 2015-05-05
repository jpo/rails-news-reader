source 'https://rubygems.org'

group :default do
  gem 'rails', '3.2.15'

  # Use to compressor for JavaScript assets
  gem 'uglifier', '>= 1.3.0'

  # Use jquery as the JavaScript library
  gem 'jquery-rails'

  # Use for authentication
  gem 'devise', '3.1.1'

  # Use for RSS feeds
  gem 'feedzirra', '0.2.1'

  # Use for error messages on forms
  gem 'dynamic_form', '1.1.4'

  # Use twitter bootstrap for UI
  gem 'therubyracer'
  gem 'less-rails'
  gem 'twitter-bootstrap-rails', '2.2.8'

  # Use high voltage for static pages
  gem 'high_voltage', '~> 2.1.0'
end

group :development do
  # Use sqlite as the database for development
  gem 'sqlite3'
end

group :production do
  # Use whenever for scheduling cron jobs
  gem 'whenever', '0.9.0', require: false
end

group :test do
  # Update for RubyMine support
  gem 'test-unit', '2.5.5'

  # Use for general testing
  gem 'shoulda'

  # Use for fixtures
  gem 'factory_girl_rails'

  # Use for mocking and stubbing
  gem 'mocha', '0.14.0', require: false

  # Use to manipulate time
  gem 'timecop', '0.7.0'
end
