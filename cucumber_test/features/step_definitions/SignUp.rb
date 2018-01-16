Given(/^I am on the juniorjobs signUp page$/) do
  @signup_page = SignUp.new(@browser)
  @signup_page.goto
end

When(/^I fill the sign up form and submit$/) do
  @signup_page.user_email = @user.email
  @signup_page.password = @user.password
  @signup_page.confirm_pass = @user.password
  @signup_page.select_junior
  @signup_page.submit
end

Then(/^account should be created and user redirect to home page with success msg "([^"]*)"$/) do |arg|
@home_page = HomePage.new(@browser)
@home_page.text.include?(arg).should == true



end

Given(/^I have credentials without email$/) do
  @signup_page.user_email = ''
  @signup_page.password = @user.password
  @signup_page.confirm_pass = @user.password
  @signup_page.select_junior
  @signup_page.submit
end

And(/^account should not be created and use see signup form$/) do
  @signup_page.text.include?('Зарегистрироваться')

end