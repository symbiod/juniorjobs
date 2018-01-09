module Jobs
  module Published
    class BaseScope < Jobs::BaseScope
      def initialize(scope = Job.all)
        super(scope.where('expired_at::date > ?', Date.today))
      end
    end
  end
end