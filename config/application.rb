require_relative "boot"
# В application.rb
require "propshaft/railtie"

require "rails/all"
require "rails"
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "action_mailer/railtie"
require "action_cable/engine"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module Lista
  class Application < Rails::Application
    config.load_defaults 8.0
    config.assets.paths << Rails.root.join('app', 'assets', 'images')
  end
end
