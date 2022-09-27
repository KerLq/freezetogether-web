# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { Faker::Name.first_name }
    sequence(:email) { |i| Faker::Internet.email(name: "#{username}#{i}") }
  end
end
