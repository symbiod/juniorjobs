# frozen_string_literal: true

module Jobs
  module Published
    # Keeps jobs that published from yesterday untill last week
    class LastWeekScope < BaseScope
      def call
        scope.where('created_at::date < ?', TimeUtility.yesterday)
              .where('created_at::date >= ?', TimeUtility.last_week)
      end
    end
  end
end
