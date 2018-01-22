# frozen_string_literal: true

# this class describe sign up page
class SignUp
  include PageObject
  page_url 'http://localhost:3000/signup'

  text_field(:user_email, id: 'user_email')
  text_field(:password, id: 'user_password')
  text_field(:confirm_pass, id: 'user_password_confirmation')
  radio_button(:junior, id: 'user_roles_junior')
  radio_button(:company, id: 'user_roles_company')
  button(:submit, name: 'commit')
  form(:new_user, id: 'new_user')
end
