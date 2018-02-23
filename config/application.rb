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
    config.assets.quiet = true

    config.autoload_paths += %W[
      #{Rails.root}/app/decorators/*
      #{Rails.root}/app/interactors/*
      #{Rails.root}/app/jobs/*
      #{Rails.root}/app/scopes/*
      #{Rails.root}/app/utilities/*
      #{Rails.root}/config/settings.yml
    ]
    config.autoload_paths += Dir["#{config.root}/app/interactors/**/"]

    config.generators do |generate|
      generate.template_engine :haml
      generate.helper true
      generate.helper_specs true
      generate.javascript_engine false
      generate.request_specs false
      generate.routing_specs true
      generate.stylesheets false
      generate.view_specs false
      generate.controller_spec true
      generate.fixture_replacement :factory_bot, dir: 'spec/factories'
      generate.test_framework :rspec
    end

    config.action_controller.action_on_unpermitted_parameters = :raise
    config.active_job.queue_adapter = :sidekiq

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ru
  end
end
