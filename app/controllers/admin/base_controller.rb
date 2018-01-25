# frozen_string_literal: true

module Admin
  # Base controller for admin namespace. Place common methods here.
  class BaseController < ApplicationController
    before_action :require_login, :check_admin

    private

    def check_admin
      return if current_user.role?(:admin)
      render plain: t('admin.base.check_admin.permission_denied'), status: :forbidden
    end
  end
end
