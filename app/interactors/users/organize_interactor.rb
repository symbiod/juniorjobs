# frozen_string_literal: true

module Users
  # # This organizer class calls Interactors by order. If first interactor fails, second will never called.
  # # Example: ValidateUser.call(params: params, roles: roles, user: user)
  # # @params value <ActionController::Parameters.new>
  # # @roles values [Array<String, Symbol>] - permitted roles
  # # @user value <User> or nil
  # class OrganizeInteractor
  #   include Interactor::Organizer
  #
  #   organize Users::ParamsValidatorInteractor, Users::SaveInteractor
  # end
end
