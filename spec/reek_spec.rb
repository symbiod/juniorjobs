# frozen_string_literal: true

require 'json'

RSpec.describe 'ReekEnsurance' do
  xit 'does not have reek warnings' do
    command = 'bin/reek --config ./.quality/.reek'
    result = `#{command} --format json`
    warnings = JSON.parse(result).size
    message = "Reek #{warnings} warnings, run '#{command}' to show them"

    expect(warnings).to eq(0), message
  end
end
