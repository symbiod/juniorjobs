# frozen_string_literal: true

module Jobs
  module Published
    # TODO: documentation is missing for this class
    # We should consider addig some documentation here
    class BaseScope < Scope
      def initialize
        @scope = Job.where('expired_at::date > ? AND status = ?', ::TimeUtility.today, 'approved')
      end
    end
  end
end
