# frozen_string_literal: true

module Pages
  # this page describe home page
  class Home
    include PageObject
    include Pages::Header

    form         :new_subscription,   id: 'new_subscription'
    text_field   :subscription_email, id: 'subscription_email'
    button       :submit,             name: 'commit'

    def fill_form(subscription)
      self.subscription_email = subscription.email

      submit
    end

    a :job_title, xpath: ".//*[@id='job-title']/a"
  end
end
