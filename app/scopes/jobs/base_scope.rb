# frozen_string_literal: true

module Jobs
  class BaseScope < Scope
    def initialize(scope = Job.all)
      @scope = scope
    end
  end
end
