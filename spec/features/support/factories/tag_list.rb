# frozen_string_literal: true

FactoryBot.define do
  factory :tag_list, class: OpenStruct do
    tag_list { 'tag1, tag2, tag3' }
  end
end