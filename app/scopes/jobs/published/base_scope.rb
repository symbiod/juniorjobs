# frozen_string_literal: true

module Jobs
  module Published
    # TODO: documentation is missing for this class
    # We should consider addig some documentation here
    class BaseScope < Scope
      QUERY = 'expired_at::date > ? AND status = ?'

      def initialize
        @scope = Job.includes(:tags, :tag_taggings).where(QUERY, ::TimeUtility.today, 'approved')
      end
    end
  end
end
