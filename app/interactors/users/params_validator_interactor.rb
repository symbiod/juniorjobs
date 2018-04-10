# frozen_string_literal: true

# namespace for Users interactors
module Users
  # This class validate user params
  # Example: ValidateParams.call(params: params, roles: roles, user: user)
  # @params value <ActionController::Parameters.new>
  # @roles values [Array<String, Symbol>] - permitted roles
  # @user value <User> or nil
  class ParamsValidatorInteractor < BaseInteractor
    def call
      if user_schema_valid?
        context.params = user_schema_params
      else
        context.fail!
      end
    end

    private

    def user_schema_valid?
      validate_params.success?
    end

    def user_schema_params
      validate_params.output
    end

    def validate_params
      user_params = context.params.to_unsafe_hash[:user]
      user_params['roles'] = Array(user_params['roles'])
      UserSchema.with(valid_roles: context.roles).call(user_params)
    end
  end
end
