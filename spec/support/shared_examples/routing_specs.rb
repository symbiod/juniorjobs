# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples 'routing_specs' do |namespace|
  described_class.instance_methods(false).each do |action_name|
    describe "##{action_name}" do
      let(:result) do
        {
          controller: "#{namespace}/#{described_class.controller_name}",
          action: action_name.to_s
        }
      end

      subject { get "/#{action_name}" }

      it { is_expected.to be_routable }
      it { is_expected.to route_to(result) }
    end
  end
end
