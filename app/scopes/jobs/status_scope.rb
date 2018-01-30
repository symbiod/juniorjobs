# frozen_string_literal: true

module Jobs
  # TODO: missing doc
  # let's add it
  class StatusScope < Scope
    def initialize
      @scope = Job.all
    end

    def call(status)
      puts status
      @scope = @scope.where(status: status) if status
      @scope.order(:status, created_at: :desc)
    end
  end
end
