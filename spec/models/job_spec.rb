# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Job, type: :model do
  let(:user) { create(:user, :company) }

  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :requirements }
  it { should validate_presence_of :employment }

  it { should validate_presence_of :company_name }
  it { should validate_presence_of :company_contact }
  it { should validate_presence_of :company_email }

  it { should validate_numericality_of :salary_from }
  it { should validate_numericality_of :salary_to }

  context 'status should be unaprooved' do
    subject { build(:job, user: user) }

    it { is_expected.to have_state(:unaprooved) }
  end

  context 'can be be aprooved' do
    subject { build(:job, user: user) }

    it { is_expected.to transition_from(:unaprooved).to(:aprooved).on_event(:aproove) }
  end

  context 'can be be unaprooved' do
    subject { build(:job, user: user) }

    it { is_expected.to transition_from(:aprooved).to(:unaprooved).on_event(:unaproove) }
  end

  context 'should be valid' do
    subject { build(:job, user: user) }

    it { is_expected.to be_valid }
  end

  context 'should be not valid' do
    subject { build(:job, :invalid, user: user) }

    it { is_expected.not_to be_valid }
  end
end
