# frozen_string_literal: true

# TODO: documentation is missing for this class
# We should consider addig some documentation here
class Scope
  attr_reader :scope

  class << self
    delegate :call, to: :new
  end

  def initialize
    raise NotImplementedError
  end

  def call
    raise NotImplementedError
  end
end
