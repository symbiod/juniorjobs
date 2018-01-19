# frozen_string_literal: true

# TODO: documentation is missing for this class
# We should consider addig some documentation here
class Authentication < ApplicationRecord
  belongs_to :user
end
