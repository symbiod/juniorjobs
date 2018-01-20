# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.0'

# Rails
gem 'dotenv'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.4'

# Common
gem 'annotate'
gem 'config'
gem 'draper'
gem 'foreman'
gem 'gibbon'
gem 'i18n-tasks', '~> 0.9.19'
gem 'interactor-rails'
gem 'koala'
gem 'mechanize'
gem 'meta-tags'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'sorcery'
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
gem 'uglifier', '>= 1.3.0'

# Frontend:helpers
gem 'country_select'
gem 'enum_help'
gem 'kaminari'
gem 'simple_form'

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'cucumber-rails', require: false
  gem 'data_magic'
  gem 'database_cleaner'
  gem 'dotenv-rails'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'faker', git: 'https://github.com/stympy/faker.git', branch: 'master'
  gem 'letter_opener'
  gem 'page-object'
  gem 'rails-controller-testing'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'seed-fu', '~> 2.3'
  gem 'selenium-webdriver'
  gem 'watir-rails'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
end

# Linters
group :development do
  gem 'bundler-audit', require: false
  # gem 'flay', require: false
  # gem 'flay-haml', require: false
  # gem 'flay-js', require: false
  # gem 'flay-persistence', require: false
  gem 'haml_lint', require: false
  gem 'rails_best_practices', require: false
  gem 'reek', require: false
  gem 'rubocop', require: false
  gem 'scss_lint', require: false
end
