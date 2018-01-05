module Jobs
  module Published
    class YesterdayScope < BaseScope
      def call
        @scope.where('created_at::date = ?', Date.today - 1.day)
      end
    end
  end
end