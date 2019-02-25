# frozen_string_literal: true

module Pages
  # this class describe admin layout
  module AdminLayout
    include PageObject
    a :users, xpath: "//a[contains(@href, 'admin/users')]"
    a :subscriptions, xpath: "//a[contains(@href, 'admin/subscriptions')]"
    a :jobs, xpath: "//a[contains(@href, 'admin/jobs')]"
  end
end
