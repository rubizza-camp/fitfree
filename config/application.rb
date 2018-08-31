require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FitFree
  class Application < Rails::Application
    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'local_env.yml')
      YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value
      end if File.exists?(env_file)
    end
    config.generators do |generator|
      generator.test_framework :rspec,
                               fixtures:         true,
                               view_specs:       false,
                               helper_specs:     false,
                               routing_specs:    false,
                               controller_specs: false,
                               request_specs:    false
      generator.fixture_replacement :factory_bot, dir: 'spec/factories'
    end
    config.exceptions_app = self.routes

    config.i18n.default_locale = :en
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.active_job.queue_adapter = Rails.env.production? ? :sidekq : :async
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
