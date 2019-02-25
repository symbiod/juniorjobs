# frozen_string_literal: true

module Pages
  # this class describe login page
  class Login
    include PageObject

    text_field   :email,        id: 'user_session_email'
    text_field   :password,     id: 'user_session_password'
    button       :submit,       name: 'commit'

    def fill_form(email, password)
      self.email = email
      self.password = password

      submit
    end
  end
end
