# frozen_string_literal: true

module Jobs
  module Published
    # TODO: documentation is missing for this class
    # We should consider addig some documentation here
    class BaseScope < Jobs::BaseScope
      def initialize(scope = Job.all)
        super(scope.where('expired_at::date > ?', Date.today))
      end
    end
  end
end
