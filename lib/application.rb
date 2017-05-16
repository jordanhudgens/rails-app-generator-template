require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module TestApp
  class Application < Rails::Application
    config.generators { |g| g.scaffold_stylesheet false }
    config.eager_load_paths << "#{Rails.root}/lib"
  end
end
