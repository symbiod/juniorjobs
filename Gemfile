source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.5.0"

gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

# Main
gem 'clockwork'
gem 'gibbon'
gem 'mechanize'
gem 'meta-tags'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'sidekiq'
gem 'sorcery'

#Frontend
gem 'bootstrap', '~> 4.0.0.beta'
gem "haml-rails", "~> 1.0"
gem 'jquery-rails'
gem 'kaminari'
gem 'simple_form'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'

  gem 'factory_bot_rails', '~> 4.0'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 3.1'
  gem "watir-rails"
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
