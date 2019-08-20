# frozen_string_literal: true

UserSchema = Dry::Validation.Schema do
  # configure do
  #   option :valid_roles
  #   config.messages = :i18n
  # end
  #
  # required(:email).filled(format?: /#{Settings.email_regex}/)
  # required(:password).filled(min_size?: 6).confirmation
  # required(:password_confirmation).filled
  # required(:roles).filled(:array?)
  #
  # validate(valid_role: :roles) do |roles|
  #   roles.all? { |role| valid_roles.include?(role) }
  # end
end
