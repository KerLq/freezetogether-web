# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

dogus = User.create(email: 'dogus@dogus.de', username: 'dogus', password: 'dogus123', email_confirmed: true, role: 1)
User.create(email: 'oussama@oussama.de', username: 'oussama', password: 'oussama', email_confirmed: true, role: 1)

6.times do
  News.create(
    title: LoremIpsum.lorem_ipsum(words: rand(2..4)),
    description: LoremIpsum.short,
    content: LoremIpsum.random(paragraphs: rand(3..8))
  )
end

achievement_weltreisender = Achievement.create(
  title: 'Weltreisender',
  description: 'Lege mindestens 100 Kilometer Distanz zurück.'
)

achievement_weltreisender.cover_image.attach(
  io: Rails.root.join('app/assets/images/test-image.png').open,
  filename: 'test-image.png'
)

spiel = Game.create(
  user: dogus,
  score: 100,
  time: 3605
)

AccomplishedAchievement.create(
  user: dogus,
  achievement: achievement_weltreisender,
  game: spiel
)
