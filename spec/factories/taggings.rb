# frozen_string_literal: true

FactoryBot.define do
  factory :tagging do
    association :tag
    association :taggable
  end
end
