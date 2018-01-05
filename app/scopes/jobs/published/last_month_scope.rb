module Jobs
  module Published
    class LastMonthScope < BaseScope
      def call
        @scope
            .where('created_at::date < ?', Date.today - 1.week)
            .where('created_at::date >= ?', Date.today - 1.month)
      end
    end
  end
end