# frozen_string_literal: true

module Jobs
  module Published
    class LastWeekScope < BaseScope
      # def call
      #   scope
      #     .where('created_at::date < ?', TimeUtility.yesterday)
      #     .where('created_at::date >= ?', TimeUtility.last_week)
      # end
    end
  end
end
