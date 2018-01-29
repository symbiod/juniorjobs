# frozen_string_literal: true

module Pages
  # this page describe new vacancy page
  class NewVacancy
    include PageObject
    form :new_job_form, id: 'new_job'

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
      fill_all_elements(vacancy)
      fill_job_expired_at(vacancy)
    end

    private

    def fill_all_elements(vacancy)
      all_elements_mapping.each do |method|
        fill_field(method, vacancy) if vacancy.send(method)
      end
    end

    def fill_job_expired_at(vacancy)
      options = job_expired_at_options
      res = nil
      options.each do |option|
        res = option if option.include? vacancy.expired_at
      end
      self.job_expired_at = res
    end

    def fill_field(method, vacancy)
      if element_is?(method, 'TextField') ||
         element_is?(method, 'SelectList') ||
         element_is?(method, 'TextArea')
        elem = "job_#{method}="
        send(elem, vacancy.send(method))
      elsif element_is?(method, 'CheckBox')
        send("check_job_#{method}")
      end
    end

    def element_is?(element, elements_class)
      send("job_#{element}_element").class.to_s.include?(elements_class)
    end

    def all_elements_mapping
      %w[title
         description
         requirements
         city
         company_name
         company_page
         company_contact
         company_phone
         company_email
         salary_from
         salary_to
         remote
         salary_by_agreement
         employment
         currency]
    end
  end
end
