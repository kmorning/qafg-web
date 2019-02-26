require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module QafgWeb
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.time_zone = 'Eastern Time (US & Canada)'
    # Don't serialize time fields with ActiveSupport::TimeWithZone - needed for TimeOfDay 
    config.active_record.time_zone_aware_types = [:datetime]

    # Use UUID's for primary keys
    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid
    end
  end
end
