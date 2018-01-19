# frozen_string_literal: true

# TODO: documentation is missing for this class
# We should consider addig some documentation here
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
