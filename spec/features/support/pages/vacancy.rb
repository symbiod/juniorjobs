# frozen_string_literal: true

module Pages
  # this page describe vacancy page
  class Vacancy
    include PageObject

    h1 :job_title, id: 'job-title'
    span :job_publication_period, id: 'publication-period'
    div :job_employment, id: 'job-employment'
    div :job_reward, id: 'reward'
    div :job_location, id: 'job-location'
    p :job_description, xpath: ".//p[@id='job-description']/following-sibling::p[1]"
    p :job_requirements, xpath: ".//p[@id='job-requirements']/following-sibling::p[1]"

    #Functionality is not implemented in the application
    p :job_tag_list, id: 'job-tag-list'

    div :job_company_name, id: 'company-name'
    div :job_company_email, id: 'job-company-email'
    div :job_company_contact, id: 'job-company-contact'
    div :job_company_phone, id: 'job-company-phone'

    def vacancies_presents_property_mapper
      %w[title description company_name company_email company_contact]
    end
  end
end
