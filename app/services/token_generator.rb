# frozen_string_literal: true

class TokenGenerator
  def generate
    Base64.encode64(Time.now.to_s)
  end
end
