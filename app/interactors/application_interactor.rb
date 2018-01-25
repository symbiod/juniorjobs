# frozen_string_literal: true

class ApplicationInteractor
  include Interactor

  def call
    raise NotImplementedError
  end
end
