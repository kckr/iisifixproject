source 'https://rubygems.org'

ruby '2.5.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'

# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'

# Use Puma as the app server
gem 'puma', '~> 3.0'

# Use Bootstrap as CSS Framework
gem 'bootstrap-sass', '~> 3.3.6'
gem 'sass-rails', '~> 5.0'

# Use Font Awesome for Awesome Icons
gem 'font-awesome-rails', '~> 4.6.3.1'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# A Issue tracker and error notifier
gem 'gitlab', '~> 3.6.1'

# TODO remove this, check in signup pages if its used there
gem 'simple_form'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Slim templates
gem 'slim-rails', '~> 3.1.1'

gem 'devise', '~> 4.5.0'

# This gem is dependency of draper, since xml serializer has been removed in Rails 5
gem 'activemodel-serializers-xml', git: 'https://github.com/rails/activemodel-serializers-xml'
# See https://github.com/drapergem/draper/issues/681#issuecomment-199861814
gem 'draper', github: 'audionerd/draper', branch: 'rails5'

gem 'omniauth-facebook', '~> 4.0.0'
gem 'omniauth-google-oauth2', '~> 0.4.1'

gem 'ransack', '~> 1.8.2'
gem 'geocoder', '~> 1.4.0'
gem 'pickadate-rails', '3.5.6.0'
# Cosmetic tools to make development and debugging easier
#  must have in every project
gem 'annotate'
gem 'figaro'
gem 'pry-rails'
gem 'awesome_print'
gem 'paranoia', '~> 2.2.0.pre' # see https://github.com/rubysherpas/paranoia/pull/351
gem 'faker', '~> 1.6.6'

gem 'mini_magick', '~> 4.5.1'
gem 'fog-aws', '~> 0.11.0'
gem 'carrierwave', '>= 1.0.0.beta', '< 2.0'

# Wrappers for JavaScript alert(), confirm() and other flexible dialogs using Twitter's bootstrap
gem 'bootbox-rails', '~> 0.4'

gem 'nexmo', '~> 4.2.0' # SMS Gateway adapter

# For Admin
gem 'country_select' # ActiveAdmin uses it
gem 'activeadmin', '~> 1.0.0.pre4'
gem 'inherited_resources', github: 'activeadmin/inherited_resources'
gem 'jquery-ui-rails', '~> 5.0.4'
gem 'chartkick'
gem 'groupdate'
gem 'responsive_active_admin'

gem 'savon', '~> 2.12.0' # SOAP client

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5', require: 'rspec/rails'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'rails-controller-testing'
end

group :development do
  gem 'sassc-rails'

  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'

  # Spring speeds up development by keeping your application running in the background.
  # Read more: https://github.com/rails/spring
  # gem 'spring'
  # gem 'spring-watcher-listen', '~> 2.0.0'

  # Rails Database Viewer and SQL Query Runner
  # Visit http://localhost:3000/rails/db
  gem 'rails_db', '1.4.1'

  gem 'rubocop', require: false
  gem 'mailcatcher', require: false # Catches emails in localhost, See https://mailcatcher.me/
  gem 'zeus', require: false
  gem 'capistrano', '3.7.1'
  gem 'capistrano3-puma'
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-rvm'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
