# frozen_string_literal: true

module Jobs
  module Published
    # TODO: documentation is missing for this class
    # We should consider addig some documentation here
    class LastWeekScope < BaseScope
      def call
        scope
          .where('created_at::date < ?', TimeUtility.yesterday)
          .where('created_at::date >= ?', TimeUtility.last_week)
      end
    end
  end
end
