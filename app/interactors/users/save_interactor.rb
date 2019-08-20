# frozen_string_literal: true

module Users
  # # This class responsible for saving or updating user
  # # Example: SaveUser.call(params: params, roles: roles, user: user)
  # # @params value <Hash> - validated user attributes
  # # @roles values [Array<String, Symbol>] - permitted roles
  # # @user value <User> or nil
  # class SaveInteractor < BaseInteractor
  #   def call
  #     context.user ||= User.new(context_params)
  #     context.fail!(message: context_user.errors.full_messages.join(', ')) unless valid_user?(context_user)
  #   end
  #
  #   private
  #
  #   def valid_user?(user)
  #     if user_persisted?
  #       user.update(context_params)
  #     else
  #       user.save
  #     end
  #   end
  #
  #   def user_persisted?
  #     context_user.present? && context_user.persisted?
  #   end
  #
  #   def context_params
  #     context.params
  #   end
  #
  #   def context_user
  #     context.user
  #   end
  # end
end
