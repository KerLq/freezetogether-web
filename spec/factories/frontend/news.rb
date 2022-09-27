# frozen_string_literal: true

FactoryBot.define do
  factory :news do
    title { Faker::Book.title }
    description { Faker::Books::Dune.quote }
    content { LoremIpsum.lorem_ipsum(words: rand(100..6000)) }
  end
end
