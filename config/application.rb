require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Iisifix
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # See http://blog.bigbinary.com/2016/08/29/rails-5-disables-autoloading-after-booting-the-app-in-production.html
    config.eager_load_paths << Rails.root.join('lib')

    config.autoload_paths << Rails.root.join('app/services')

    config.assets.enabled = true
    config.assets.paths << Rails.root.join('/app/assets/fonts')

    # See http://goo.gl/Ar1M61
    config.generators do |generators|
      generators.test_framework  :rspec, fixture: false
      generators.javascripts false
      generators.helper false
      generators.view_specs false
      generators.helper_specs false
      generators.controller_specs false

      generators.model_specs false
      generators.fixtures false

      generators.stylesheets false
      generators.decorator_specs false
      generators.decorator false
    end
    config.active_record.time_zone_aware_types = [:datetime, :time]

    # For sanitization purposes
    #   see: https://cbabhusal.wordpress.com/2015/02/06/rails-sanitize-your-data-from-harmful-html-tags-etc/
    # #
    config.action_view.sanitized_allowed_tags = %w(del dd h3 address big sub tt a ul h4 cite dfn h5 small kbd code b ins img h6 sup pre strong blockquote acronym dt br p samp li ol var em div h1 i abbr h2 span hr)
    config.action_view.sanitized_allowed_attributes = %w(name href style cite class title src xml:lang height datetime alt abbr width)

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

  end
end
