require_relative "boot"

require "action_controller/railtie"
require "action_view/railtie"
require "action_mailer/railtie"
require "rails/test_unit/railtie"
require "sprockets/railtie"
# Require jasmine at runtime allow the app:jasmine:ci task to build correctly

begin
  require "jasmine"
rescue LoadError
  puts "Running in production mode"
end

Bundler.require(*Rails.groups)
require "govuk_tables"

module Dummy
  class Application < Rails::Application
  end
end
