# frozen_string_literal: true

module Web
  # Controller responsible for rendering static pages
  class StaticPagesController < BaseController
    def about
      @contributors = Integrations::Github::ContributorsInteractor.call.result
    end

    def terms; end

    def contact_us; end
  end
end
