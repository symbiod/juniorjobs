# frozen_string_literal: true

module Jobs
  module Published
    # TODO: documentation is missing for this class
    # We should consider addig some documentation here
    class TodayScope < BaseScope
      def call
        @scope.where('created_at::date = ?', Date.today)
      end
    end
  end
end
