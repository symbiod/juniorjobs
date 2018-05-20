# frozen_string_literal: true

RSpec.describe TimeUtility do
  describe 'today' do
  end

  describe 'yesterday' do
  end

  describe 'last_week' do
  end

  describe 'last_month' do
  end

  describe 'parse_interval' do
    let(:string) { '12_days' }
    let(:result) { 12.days }

    it 'should parse date interval' do
      expect(described_class.parse_interval(string)).to eq(result)
    end
  end

  describe 'time_from' do
  end
end
