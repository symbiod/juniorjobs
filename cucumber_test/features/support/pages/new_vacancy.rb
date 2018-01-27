# frozen_string_literal: true

module Pages
  # this page describe new vacancy page
  class NewVacancy
    include PageObject
    text_field :job_title, id: 'job_title'
    select_list :job_employment, id: 'job_employment'
    text_area :job_description, id: 'job_description'
    text_area :job_requirements, id: 'job_requirements'
    text_field :job_city, id: 'job_city'
    checkbox :job_remote, id: 'job_remote'
    text_field :job_company_name, id: 'job_company_name'
    text_field :job_company_page, id: 'job_company_page'
    text_field :job_company_contact, id: 'job_company_contact'
    text_field :job_company_phone, id: 'job_company_phone'
    text_field :job_company_email, id: 'job_company_email'
    select_list :job_currency, id: 'job_currency'
    text_field :job_salary_from, id: 'job_salary_from'
    text_field :job_salary_to, id: 'job_salary_to'
    checkbox :job_salary_by_agreement, id: 'job_salary_by_agreement'
    select_list :job_expired_at, id: 'job_expired_at'
    button :submit, name: 'commit'

    def fill_form(vacancy)
      # select.job_employment_full
      # job_currency.select_usd
      # self.job_expired_at

      forms_methods_mapping.each do |method|
        elem = "job_#{method}="
        self.send(elem, vacancy.send(method))
      end
      # checkbox.job_remote if vacancy.remote
      # checkbox.job_salary_by_agreement if vacancy.salary_by_agreement
    end

    private

    def forms_methods_mapping
      %w[title description
         requirements
         city
         company_name
         company_page
         company_contact
         company_phone
         company_email
         salary_from
         salary_to]
    end
  end
end
