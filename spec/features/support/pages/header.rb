# frozen_string_literal: true

module Pages
  #  describe Header
  module Header
    include PageObject
    a :add_vacancy, xpath: "*//a[contains(@class,'new-job')]"
  end
end
