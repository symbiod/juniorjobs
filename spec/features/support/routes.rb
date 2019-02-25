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
        vacancy: {
            path: '/jobs',
            page_class: Pages::Vacancy
        },
        new_vacancy: {
          path: '/jobs/new',
          page_class: Pages::NewVacancy
        },
        login: {
            path: '/login',
            page_class: Pages::Login
        },
        admin_dashboard: {
            path: '/admin',
            page_class: Pages::AdminDashboard
        }
      }
    end
  end
end
