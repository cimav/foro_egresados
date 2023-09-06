require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ForoEgresados
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    #

    config.time_zone = 'Chihuahua' # = "America/Chihuahua"
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :es

    # Email Configuration
    config.action_mailer.raise_delivery_errors = true # Don't care if the mailer can't send.
    config.action_mailer.perform_caching = false
    config.action_mailer.perform_deliveries = true
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.default_url_options = { host: ENV['DEFAULT_MAILER_URL'] } # es que aparece en los emails
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
        :address   => "smtp.gmail.com",
        :port      => 587,
        :domain    =>  "cimav.edu.mx",
        :authentication => :plain,
        :user_name      => ENV['EMAIL_USER'],
        :password       => ENV['EMAIL_PASSWORD'],
        :enable_starttls_auto => true
    }

    config.action_controller.forgery_protection_origin_check = false

  end
end
