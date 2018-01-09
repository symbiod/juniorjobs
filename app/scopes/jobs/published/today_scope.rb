module Jobs
  module Published
    class TodayScope < BaseScope
      def call
        @scope.where('created_at::date = ?', Date.today)
      end
    end
  end
end