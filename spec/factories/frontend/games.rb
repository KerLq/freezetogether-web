# frozen_string_literal: true

FactoryBot.define do
  factory :game do
    coin { rand(1..3000) }
    score { (1..3_874_528_793) }
    time { DateTime.now }
  end
end
