# frozen_string_literal: true

FactoryBot.define do
  factory :character do
    name { Faker::FunnyName.three_word_name }
    quote { Faker::Quote.most_interesting_man_in_the_world }
  end
end
