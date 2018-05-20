# frozen_string_literal: true

module Jobs
  module Published
    # Keeps jobs scope that published today
    class TodayScope < BaseScope
      def call
        scope.where('created_at::date = ?', TimeUtility.today)
      end
    end
  end
end
