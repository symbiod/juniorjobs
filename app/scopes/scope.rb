# frozen_string_literal: true

# Keeps base scope implementation
class Scope
  attr_reader :scope

  class << self
    delegate :call, to: :new
  end

  def initialize
    raise NotImplementedError
  end
end
