module Jobs
  module Published
    class LastWeekScope < BaseScope
      def call
        @scope
            .where('created_at::date < ?', Date.today - 1.day)
            .where('created_at::date >= ?', Date.today - 1.week)
      end
    end
  end
end