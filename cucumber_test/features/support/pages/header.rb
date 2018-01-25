# frozen_string_literal: true

module Pages
  #  describe header
  module Header
    include PageObject
    a :add_vacancy, xpath: "*//a[contains(@class,'new-job')]"
  end
end
