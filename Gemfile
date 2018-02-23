# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.0'

# Rails
gem 'config'
gem 'dotenv-rails'
gem 'foreman'
gem 'pg', '~> 0.18'
gem 'rails', '~> 5.1.4'
gem 'puma', '~> 3.7'

# Models
gem 'aasm'
gem 'acts-as-taggable-on'
gem 'draper'
gem 'dry-validation'
gem 'pundit'

# Common
gem 'gibbon'
gem 'interactor', '~> 3.0'
gem 'mechanize'
gem 'meta-tags'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'sorcery'

# Socials
gem 'koala'
gem 'telegram-bot-ruby'
gem 'twitter'
gem 'vkontakte_api', '~> 1.4'

# Jobs
gem 'sidekiq'

# Cron
gem 'clockwork'

# Frontend
gem 'coffee-rails', '~> 4.2'
gem 'haml-rails', '~> 1.0'
gem 'jquery-rails'
gem 'multipurpose_theme', github: 'khusnetdinov/multipurpose_theme'
gem 'patternfly-sass'
gem 'sass-rails', '~> 5.0'
gem 'select2-rails'
gem 'uglifier', '>= 1.3.0'

# Frontend:helpers
gem 'country_select'
gem 'enum_help'
gem 'kaminari'
gem 'simple_form'

# Infrastructure
gem 'newrelic_rpm'
gem 'rollbar'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'database_cleaner'
  gem 'data_magic'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'faker', git: 'https://github.com/stympy/faker.git', branch: 'master'
  gem 'letter_opener'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'seed-fu', '~> 2.3'
  gem 'simplecov', require: false
  gem 'shoulda-matchers', '~> 3.1'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'webmock'
  gem 'bullet'
end

group :test do
  gem 'database_cleaner'
end

group :development do
  gem 'brakeman', require: false
  gem 'bundler-audit'
  gem 'haml_lint', require: false
  gem 'i18n-tasks', '~> 0.9.19'
  gem 'reek'
  gem 'rubocop'
  gem 'scss_lint', require: false
  gem 'web-console', '>= 3.3.0'
end
