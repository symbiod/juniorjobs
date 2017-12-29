class UserDecorator
  def initialize(user)
    @user = user
  end

  def has_subscription?
    @user&.subscription == true
  end
end