# frozen_string_literal: true

module Jobs
  module Published
    # Keeps main jobs published selected by approved status and expiration time
    class BaseScope < Jobs::BaseScope
      def initialize
        @scope = super.includes(:tags, :tag_taggings)
                      .where('expired_at::date > ? AND status = ?', ::TimeUtility.today, 'approved')
      end
    end
  end
end
