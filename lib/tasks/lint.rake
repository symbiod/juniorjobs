# frozen_string_literal: true

require 'json'
require 'yaml'

def handle_cops(linter, warnings_count, command)
  return unless warnings_count.positive?

  puts "#{linter.capitalize} found #{warnings_count} warnings."
  puts "For details run: '#{command}'"
  exit(1)
end

desc 'Lint all'
task lint: :environment do
  %i[
      brakeman_errors
      brakeman_security
      brakeman_warning
      bundle javascript
      haml
      locales_missing
      locales_unused
      reek
      rubocop
      rspec
      scss
    ].each do |linter|
    Rake::Task["lint:#{linter}"].execute
  end
end

namespace :lint do
  desc 'Lint *.rb files for brakeman errors'
  task brakeman_errors: :environment do
    command = 'bin/brakeman --ignore-config ./.quality/.brakeman.ignore --config ./.quality/.brakeman.yml'
    output = `#{command} --format json --quiet`
    warnings_actual = JSON.parse(output)['errors'].size
    handle_cops(:brakeman_errors, warnings_actual, command)
  end

  desc 'Lint *.rb files for brakeman security warnings'
  task brakeman_security: :environment do
    command = 'bin/brakeman --ignore-config ./.quality/.brakeman.ignore --config ./.quality/.brakeman.yml'
    output = `#{command} --format json --quiet`
    warnings_actual = JSON.parse(output)['warnings'].size
    handle_cops(:brakeman_errors, warnings_actual, command)
  end

  desc 'Lint *.rb files for brakeman warnings'
  task brakeman_warning: :environment do
    command = 'bin/brakeman --ignore-config ./.quality/.brakeman.ignore --config ./.quality/.brakeman.yml'
    output = `#{command} --format json --quiet`
    warnings_actual = JSON.parse(output)['scan_info']['security_warnings']
    handle_cops(:brakeman_errors, warnings_actual, command)
  end

  desc 'Lint gems vulnerabilities'
  task bundle: :environment do
    output = `bin/bundle-audit check`
    warnings_actual = output.shellescape.split("'\n''\n'").count - 1
    handle_cops(:bundler, warnings_actual, 'bin/bundle-audit')
  end

  desc 'Lint *.js files'
  task javascript: :environment do
    command = './node_modules/eslint/bin/eslint.js app/assets/javascripts -c ./.quality/.eslintrc.yml'
    output = `#{command} --format json`
    warnings = JSON.parse(output).first['warningCount']
    errors = JSON.parse(output).first['errorCount']
    handle_cops(:javascript, warnings + errors, command)
  end

  desc 'Lint *.haml files'
  task haml: :environment do
    path = 'app/views/**/*.haml'
    command = "bin/haml-lint #{path} --config ./.quality/.haml-lint.yml"
    result = `#{command} --reporter JSON`
    warnings_actual = JSON.parse(result)['summary']['offense_count']
    handle_cops(:haml, warnings_actual, command)
  end

  desc 'Lint config/locales/*.yml files'
  task locales_missing: :environment do
    command = 'bin/i18n-tasks missing'
    output = `#{command} --format json`
    warnings_actual = JSON.parse(output).keys.count
    handle_cops(:locales_missing, warnings_actual, command)
  end

  desc 'Lint config/locales/*.yml files'
  task locales_unused: :environment do
    command = 'bin/i18n-tasks unused'
    output = `#{command} --format json`
    warnings_actual = JSON.parse(output).keys.count
    handle_cops(:locales_unused, warnings_actual, command)
  end

  desc 'Lint *.rb files by reek'
  task reek: :environment do
    command = 'bin/reek app/* lib/* --config ./.quality/.reek'
    output = `#{command} --format json`
    warnings_actual = JSON.parse(output).size
    handle_cops(:reek, warnings_actual, command)
  end

  desc 'Lint *.rb files by rubocop'
  task rubocop: :environment do
    command = 'bin/rubocop --config ./.quality/.rubocop.yml'
    output = `#{command} --format json`
    warnings_actual = JSON.parse(output)['summary']['offense_count']
    handle_cops(:rubocop, warnings_actual, command)
  end

  desc 'Lint rspec errors'
  task :rspec do
    output = `bin/rspec --format json`
    warnings_actual = JSON.parse(output)['summary']['failure_count']
    handle_cops(:rspec, warnings_actual, 'bin/rspec')
  end

  desc 'Lint *.scss files'
  task :scss do
    command = 'bin/scss-lint'
    output = `#{command} --format JSON`
    warnings_actual = JSON.parse(output).keys.count
    handle_cops(:scss_lint, warnings_actual, command)
  end
end
