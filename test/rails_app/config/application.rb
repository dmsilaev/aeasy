require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "action_mailer/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require :default, 'active_record'
require "active_record/railtie"

require 'adminos/auth'

module RailsApp
  class Application < Rails::Application

    config.autoload_paths.reject!{ |p| p =~ /\/app\/(\w+)$/ && !%w(controllers helpers mailers views models).include?($1) }

    config.filter_parameters << :password
    config.assets.enabled = false

    config.action_mailer.default_url_options = { host: "localhost", port: 3000 }
  end
end
