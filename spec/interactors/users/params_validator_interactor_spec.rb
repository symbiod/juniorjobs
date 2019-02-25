# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::ParamsValidatorInteractor do
  let(:permitted_roles) { %w[junior company] }

  subject(:context) { described_class.call(params: params, roles: permitted_roles, user: nil) }

  describe '.call' do
    context 'when given valid credentials and roles as array' do
      let(:params) do
        ActionController::Parameters.new(user: attributes_for(:user, :junior).except(:crypted_password, :salt))
      end

      xit 'succeeds' do
        expect(context).to be_a_success
      end

      xit 'provides the params' do
        expect(context.params.with_indifferent_access).to eq(params.to_unsafe_hash[:user])
      end
    end

    context 'when given valid credentials and roles as string' do
      let(:params) do
        ActionController::Parameters.new(
          user: attributes_for(:user, :junior).except(:crypted_password, :salt).merge(roles: 'junior')
        )
      end

      xit 'succeeds' do
        expect(context).to be_a_success
      end

      xit 'converts roles to array' do
        expect(context.params[:roles]).to eq(['junior'])
      end

      context 'valid credentials and filter extra params' do
        let(:params) do
          ActionController::Parameters.new(user: attributes_for(:user, :junior), job: 'some param')
        end

        xit 'succeeds' do
          expect(context).to be_a_success
        end

        xit 'filters extra params' do
          expect(context.params.keys).to eq(%i[email password password_confirmation roles])
        end
      end
    end

    context 'when given invalid credentials (unpermitted role)' do
      let(:params) do
        ActionController::Parameters.new(user: attributes_for(:user, :admin).except(:crypted_password, :salt))
      end

      xit 'fails' do
        expect(context).to be_a_failure
      end
    end

    context 'when given invalid credentials (empty required fields)' do
      let(:params) do
        ActionController::Parameters.new(user: attributes_for(:user, :junior).merge(email: ''))
      end

      xit 'fails' do
        expect(context).to be_a_failure
      end
    end
  end
end
