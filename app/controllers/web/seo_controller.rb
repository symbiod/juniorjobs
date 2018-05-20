# frozen_string_literal: true

module Web
  # SeoController generate metadata for browsers and search engines:
  # robots.txt and site.xml
  class SeoController < Web::BaseController
    before_action :cache, only: %i[robots sitemap]
    before_action :load_settings, only: %i[robots sitemap]

    def robots; end

    def sitemap
      @jobs = Job.status(:approved).pluck(:id)

      respond_to do |format|
        format.xml
      end
    end

    private

    def cache
      expires_in 6.hours, public: true if Rails.env.production?
    end

    def load_settings
      @allowed_routes = SettingsUtility.site_allowed
      @disallow_routes = SettingsUtility.site_disallowed
      @base_url = SettingsUtility.site_url
    end
  end
end
