# frozen_string_literal: true

module Jobs
  module Published
    # TODO: documentation is missing for this class
    # We should consider addig some documentation here
    class YesterdayScope < BaseScope
      def call
        scope.where('created_at::date = ?', TimeUtility.yesterday)
      end
    end
  end
end
