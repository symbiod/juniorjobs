# frozen_string_literal: true

# Constraint for routes
class AdminConstraint
  def matches?(request)
    return false unless request.session[:user_id]
    user = User.find(request.session[:user_id])
    user.present? && user.role?(:admin)
  end
end
