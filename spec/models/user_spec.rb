require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
  it { should validate_length_of :password }
  it { should validate_presence_of :roles }

  context 'create valid user' do
    subject { build(:user, :junior) }
    it { is_expected.to be_valid }
  end

  context 'create invalid user with wrong email' do
    subject { build(:user, email: 'abcd@') }

    it { is_expected.not_to be_valid }
  end

  context 'create invalid user, not unique email' do
    let(:user) { create(:user, :admin) }
    subject { build(:user, :admin, email: user.email) }

    it { is_expected.not_to be_valid }
  end

  context 'add to user wrong role' do
    let(:user) { build(:user, roles: ['moderator']) }

    it 'show invalid role name in errors' do
      user.valid?
      expect(user.errors[:roles]).to include('moderator - is not a valid role')
    end
  end

  describe '.add_roles' do
    let(:user) { create(:user, :junior) }
    subject { user.roles }

    context 'add valid roles' do
      it 'adds new roles to user' do
        user.add_roles(:admin, :company)
        expect(subject).to eq(%w[junior admin company])
      end

      it 'not adds not unique roles to user' do
        user.add_roles(:junior, :junior)
        expect(subject).to eq(['junior'])
      end
    end

    context 'add invalid roles' do
      it 'add new roles to user' do
        user.add_roles(:moderator)
        expect(subject).to eq(%w[junior])
      end

      it 'add valid roles and not add invalid' do
        user.add_roles(:junior, :moderator)
        expect(subject).to eq(['junior'])
      end
    end
  end

  describe '.remove_roles' do
    let(:user) { create(:user, roles: %w[junior admin company]) }
    subject { user.roles }

    it 'remove roles from user' do
      user.remove_roles(:admin)
      expect(subject).to eq(%w[junior company])
    end

    it 'remove few roles from user' do
      user.remove_roles(:admin, :company, :moderator)
      expect(subject).to eq(['junior'])
    end
  end
end
