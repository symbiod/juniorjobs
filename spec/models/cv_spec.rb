# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cv, type: :model do
  let(:user) { create(:user, :junior) }
  let(:cv) { create(:cv, user_id: user.id) }

  it { should validate_presence_of :title }
  it { should validate_presence_of :name }
  it { should validate_presence_of :employment }
  it { should validate_presence_of :description }

  it { should validate_presence_of :phone }
  it { should validate_presence_of :email }

  it { should validate_numericality_of :salary_from }
  it { should validate_numericality_of :salary_to }

  context 'should be valid' do
    subject { build(:cv, user: user) }

    it { is_expected.to be_valid }
  end

  context 'should be not valid' do
    subject { build(:cv, :invalid, user: user) }

    it { is_expected.not_to be_valid }
  end
end
