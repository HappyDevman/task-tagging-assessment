# frozen_string_literal: true

FactoryBot.define do
  factory :tag do
    name { Faker::Lorem.sentence(word_count: 5) }
  end
end
