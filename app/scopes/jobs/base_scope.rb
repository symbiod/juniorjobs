# frozen_string_literal: true

module Jobs
  # TODO: missing doc
  # let's add it
  class BaseScope < Scope
    def initialize(scope = Job.all)
      @scope = scope
    end
  end
end
