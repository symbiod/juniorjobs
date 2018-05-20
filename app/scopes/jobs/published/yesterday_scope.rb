# frozen_string_literal: true

module Jobs
  module Published
    # Keeps jobs that publushed yesterday
    class YesterdayScope < BaseScope
      def call
        scope.where('created_at::date = ?', TimeUtility.yesterday)
      end
    end
  end
end
