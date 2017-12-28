require 'rails_helper'

RSpec.describe Subscription, type: :model do
  it { should validate_presence_of :email }

  context 'try to create subscription with invalid email' do
    let(:subscription) { build(:subscription, email: 'qwerty') }
    it 'show is invalid error' do
      subscription.valid?
      expect(subscription.errors[:email]).to include("is invalid")
    end
  end

  context 'try to create subscription with blank email' do
    let(:subscription) { build(:subscription, email: '') }
    it "show can't be blank error" do
      subscription.valid?
      expect(subscription.errors[:email]).to include("can't be blank")
    end
  end

  context 'try to create subscription with already taken email' do
    let!(:subscription) { create(:subscription, email: 'mail@mail.com') }
    let(:duplicate_subscription) { build(:subscription, email: 'mail@mail.com') }
    it 'show already taken error' do
      duplicate_subscription.valid?
      expect(duplicate_subscription.errors[:email]).to include("has already been taken")
    end
  end

  context 'create subscription with right email' do
    subject { build(:subscription) }
    it { is_expected.to be_valid }
  end
end
