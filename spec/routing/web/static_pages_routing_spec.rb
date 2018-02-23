# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Web::StaticPagesController, type: :routing do
  include_examples 'routing_specs', 'web', described_class
end
