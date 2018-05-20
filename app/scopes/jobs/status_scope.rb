# frozen_string_literal: true

module Jobs
  # Keeps jobs scope that returns models by status
  class StatusScope < BaseScope
    def call(status)
      @scope = scope.where(status: status) if status
      scope.order(:status, created_at: :desc)
    end
  end
end
