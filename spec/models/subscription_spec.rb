# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Subscription, type: :model do
  it { should validate_presence_of :email }

  describe 'try to create subscription with invalid email' do
    let(:subscription_invalid) { build(:guest_subscription, email: 'qwerty') }

    before { subscription_invalid.valid? }

    subject { subscription_invalid.errors[:email] }

    it { is_expected.to include I18n.t('errors.subscription.attributes.email.invalid') }
  end

  describe 'try to create subscription with blank email' do
    let(:subscription_blank) { build(:guest_subscription, email: '') }

    before { subscription_blank.valid? }

    subject { subscription_blank.errors[:email] }

    it { is_expected.to include I18n.t('errors.subscription.attributes.email.blank') }
  end

  describe 'try to create subscription with already taken email' do
    let!(:subscription) { create(:guest_subscription, email: 'mail@mail.com') }
    let(:duplicate_subscription) { build(:guest_subscription, email: 'mail@mail.com') }

    before { duplicate_subscription.valid? }

    subject { duplicate_subscription.errors[:email] }

    it { is_expected.to include I18n.t('errors.subscription.attributes.email.taken') }
  end

  describe 'registered user can to subscribe and unsubscribe' do
    let(:email) { 'mail@mail.com' }
    let(:subscription) { create(:user_subscription, email: email) }

    before { subscription.destroy }

    subject { Subscription.find_by(email: email) }

    it { is_expected.to be_falsey }
  end

  describe 'create subscription with right email' do
    subject { build(:guest_subscription) }
    it { is_expected.to be_valid }
  end
end
