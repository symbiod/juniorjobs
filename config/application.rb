require_relative 'boot'

require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module JuniorjobsRu
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.autoload_paths += %W[
      #{config.root}/app/utilities
      #{config.root}/app/scopes
    ]

    config.assets.quiet = true

    config.generators do |generate|
      generate.template_engine :haml
      generate.helper true
      generate.javascript_engine false
      generate.request_specs false
      generate.routing_specs true
      generate.stylesheets false
      generate.view_specs false
      generate.test_framework :rspec
    end

    config.action_controller.action_on_unpermitted_parameters = :raise

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ru
    config.generators do |g|
      g.test_framework :rspec,
                        view_spec:false,
                        helper_specs: false,
                        routing_specs: false,
                        request_specs: false,
                        controller_spec: true
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
    end
    config.autoload_paths += %W(#{config.root}/app/workers)
  end
end
