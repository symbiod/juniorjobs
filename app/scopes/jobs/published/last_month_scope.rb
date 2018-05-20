# frozen_string_literal: true

module Jobs
  module Published
    # Keeps jobs scope that were published from last week untill last month
    class LastMonthScope < BaseScope
      def call
        scope.where('created_at::date < ?', TimeUtility.last_week)
              .where('created_at::date >= ?', TimeUtility.last_month)
      end
    end
  end
end
