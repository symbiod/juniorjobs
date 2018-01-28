# frozen_string_literal: true

# Constraint for routes
class AdminConstraint
  def self.matches?(request)
    user_id = request.session[:user_id]

    return false unless user_id

    user = User.find_by(id: user_id)
    user.present? && user.role?(:admin)
  end
end
