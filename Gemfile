# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby File.read('.ruby-version').strip

gem 'aasm', '5.1.1'
gem 'acts-as-taggable-on'
gem 'clockwork'
gem 'coffee-rails', '~> 4.2'
gem 'config'
gem 'country_select'
gem 'draper', '4.0.1'
gem 'dry-validation'
gem 'dotenv-rails'
gem 'enum_help'
gem 'faker'
gem 'foreman'
gem 'gibbon'
gem 'interactor', '~> 3.0'
gem 'haml-rails', '~> 1.0'
gem 'jquery-rails', '4.4.0'
gem 'json', '2.3.0'
gem 'kaminari', '1.2.1'
gem 'koala'
gem 'mechanize'
gem 'meta-tags'
gem 'multipurpose_theme', github: 'khusnetdinov/multipurpose_theme'
gem 'newrelic_rpm', '6.13.1'
gem 'octokit', '~> 4.0'
gem 'patternfly-sass'
gem 'pg', '~> 0.21'
gem 'pundit'
gem 'puma', '~> 3.12.6'
gem 'rack', '2.1.4'
gem 'rails', '~> 5.2.4.6'
gem 'ransack', '~> 2.3.2'
gem 'redis'
gem 'redis-namespace'
gem 'rollbar', '3.0.1'
gem 'sass-rails', '~> 5.0'
gem 'select2-rails'
gem 'sidekiq'
gem 'simple_form', '5.0.3'
gem 'sorcery', '0.15.0'
gem 'telegram-bot-ruby'
gem 'twitter'
gem 'vkontakte_api', '~> 1.4'
gem 'uglifier', '>= 1.3.0'
gem 'websocket-extensions', '0.1.5'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'database_cleaner'
  gem 'data_magic'
  gem 'factory_bot_rails', '~> 4.0'
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
end

group :development do
  gem 'brakeman', '4.10.0', require: false
  gem 'bullet'
  gem 'bundler-audit'
  gem 'haml_lint', require: false
  gem 'i18n-tasks', '~> 0.9.19'
  gem 'reek'
  gem 'rubocop'
  gem 'rubocop-rspec'
  gem 'scss_lint', require: false
  gem 'web-console', '>= 3.3.0'
end
