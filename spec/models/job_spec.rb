require 'rails_helper'

RSpec.describe Job, type: :model do
  subject { build(:job) }

  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :employment_type }
  it { should validate_presence_of :city }
  it { should validate_presence_of :tasks }
  it { should validate_presence_of :requirements }
  it { should validate_presence_of :condition }
  it { should validate_numericality_of :salary_from }
  it { should validate_numericality_of :salary_to }

  it 'should be valid' do
    subject.should be_valid
  end
end
