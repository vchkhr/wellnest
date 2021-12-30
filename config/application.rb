require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv::Railtie.load

module Mhc
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.default_url_options = { host: ENV['HOST'] }
    config.action_mailer.smtp_settings = {
      :user_name => ENV['EMAIL_USER_NAME'],
      :password => ENV['EMAIL_PASSWORD'],
      :address => ENV['EMAIL_ADDRESS'],
      :domain => ENV['EMAIL_DOMAIN'],
      :port => ENV['EMAIL_PORT'],
      :authentication => :cram_md5
    }
  end
end
