source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.0', '< 5.1'
# Use sqlite3 as the database for Active Record
gem 'pg', '~> 0.21'
# Use SCSS for stylesheets
gem 'sassc-rails', '~> 2.1.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'less-rails'
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'haml-rails'

# Post rendering
gem 'nokogiri'
gem 'redcarpet'

gem 'rouge', '~> 3.1.0'

# Post categories
gem 'acts-as-taggable-on', '~> 4.0.0'

# Post comments
gem 'disqus_rails', '0.0.6'

# Pics upload
gem 'paperclip', '~> 5.2.0'

# Manage sensible information
gem 'dotenv-rails'

# User
gem 'authlogic', '~> 3.6.1'
gem 'omniauth-github', '~> 1.3.0'

# Fixing vulnerabilities
gem 'omniauth-rails_csrf_protection'

# User roles
gem 'cancancan', '~> 1.10'

# SEO
gem 'friendly_id', '~> 5.1.0'
gem 'sitemap_generator'

# Recaptcha
gem 'recaptcha', require: 'recaptcha/rails'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Puma as the app server
gem 'puma'

# Use Capistrano for deployment
gem 'capistrano', '~> 3.10.0'
gem 'capistrano-rails', '~> 1.1.6'
gem 'capistrano3-puma', '~> 3.1.1'
gem 'capistrano-rvm'
gem 'capistrano-nvm'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.0'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'bundler-audit'
end

group :test do
  gem 'simplecov'
  gem 'factory_bot_rails'
  gem 'codeclimate-test-reporter', '~> 1.0.0'
  gem 'rails-controller-testing'
end
