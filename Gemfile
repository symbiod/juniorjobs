source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.0'

# Rails
gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'dotenv'

gem 'puma', '~> 3.7'

# Common
gem 'foreman'
gem 'gibbon'
gem 'mechanize'
gem 'meta-tags'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'sorcery'
gem 'i18n-tasks', '~> 0.9.19'

# Jobs
gem 'sidekiq'

# Cron
gem 'clockwork'

# Frontend
gem 'haml-rails', '~> 1.0'
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'uglifier', '>= 1.3.0'
gem 'multipurpose_theme', github: 'khusnetdinov/multipurpose_theme'
gem 'patternfly-sass'

# Frontend:helpers
gem 'country_select'
gem 'kaminari'
gem 'simple_form'
gem 'enum_help'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'

  gem 'factory_bot_rails', '~> 4.0'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'watir-rails'
  gem 'rails-controller-testing'
  gem 'letter_opener'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  gem 'haml_lint', require: false
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
