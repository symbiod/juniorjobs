# frozen_string_literal: true

module Routes
  # dictionary
  class Mapper
    def self.path_for(route_name)
      mapping[route_name.to_sym][:path]
    end

    def self.page_class_for(route_name)
      mapping[route_name.to_sym][:page_class]
    end

    def self.mapping
      {
        home: {
          path: '/',
          page_class: Pages::Home
        },
        sign_up: {
          path: '/signup',
          page_class: Pages::SignUp
        },
        new_vacancy: {
          path: '/jobs/new',
          page_class: Pages::NewVacancy
        }
      }
    end
  end
end
