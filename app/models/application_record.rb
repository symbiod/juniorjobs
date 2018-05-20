# # frozen_string_literal: true

# Keeps general Rails model
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
