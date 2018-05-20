# frozen_string_literal: true

module Jobs
  # Keeps jobs scope
  class BaseScope < Scope
    def initialize
      @scope = Job.all
    end
  end
end
