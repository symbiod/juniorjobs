# frozen_string_literal: true

RSpec.describe Scope do
  describe '.new' do
    it 'should be not implemented' do
      expect { described_class.new }.to raise_error(NotImplementedError)
    end
  end

  describe '.call' do
    it 'should be not implemented' do
      expect { described_class.call }.to raise_error(NotImplementedError)
    end
  end
end
