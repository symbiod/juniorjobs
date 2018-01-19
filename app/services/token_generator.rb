# frozen_string_literal: true

# TODO: documentation is missing for this class
# We should consider addig some documentation here
class TokenGenerator
  def generate
    Base64.encode64(Time.now.to_s)
  end
end
