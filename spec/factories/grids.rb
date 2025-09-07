# frozen_string_literal: true

FactoryBot.define do
  factory :grid do
    initialize_with { new(height: height, width: width) }

    height { 5 }
    width { 5 }

    trait :small do
      height { 3 }
      width { 3 }
    end

    trait :large do
      height { 10 }
      width { 10 }
    end
  end
end
