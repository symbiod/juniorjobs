require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
  it { should validate_length_of :password }

  context 'create valid user' do
    subject { build(:user, :with_roles) }
    it { is_expected.to be_valid }
  end

  context 'create invalid user with wrong email' do
    subject { build(:user, email: 'abcd@') }

    it { is_expected.not_to be_valid }
  end

  context 'create invalid user, not unique email' do
    let(:user) { create(:user) }
    subject { build(:user, email: user.email) }

    it { is_expected.not_to be_valid }
  end

  context 'add to user wrong role' do
    let(:user) { build(:user, :with_roles, roles: [:moderator]) }

    it 'show invalid role name in errors' do
      user.valid?
      expect(user.errors[:roles]).to include('moderator - is not a valid role')
    end
  end
end
