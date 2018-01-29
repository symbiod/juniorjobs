# frozen_string_literal: true

# Base controller for admin namespace. Place common methods here.
module Web
  module Admin
    class BaseController < Web::BaseController
      before_action :require_login, :check_admin

      private

      def check_admin
        return if current_user.role?(:admin)
        render plain: t('admin.base.check_admin.permission_denied'), status: :forbidden
      end
    end
  end
end
