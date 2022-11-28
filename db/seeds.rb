# frozen_string_literal: true

## User
dogus = User.create(email: 'dogus@dogus.de', username: 'dogus', password: 'dogus123', email_confirmed: true, role: 1)
User.create(email: 'oussama@oussama.de', username: 'oussama', password: 'oussama', email_confirmed: true, role: 1)

## News
6.times do
  News.create(
    title: LoremIpsum.lorem_ipsum(words: rand(2..4)),
    description: LoremIpsum.short,
    content: LoremIpsum.random(paragraphs: rand(3..8))
  )
end

## Achievements
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
  achievement: achievement_weltreisender,
  game: spiel
)

Faq.create(
  question: 'How can I download Freeze Together?',
  answer: LoremIpsum.lorem_ipsum(words: 25),
  category: 'general'
)

Faq.create(
  question: 'Is Freeze Together free to play?',
  answer: LoremIpsum.lorem_ipsum(words: 25),
  category: 'general'
)

Faq.create(
  question: 'Can I play online with my friends?',
  answer: LoremIpsum.lorem_ipsum(words: 25),
  category: 'game'
)
Faq.create(
  question: 'How can I save my scores?',
  answer: LoremIpsum.lorem_ipsum(words: 25),
  category: 'game'
)

## Characters
jaxson = Character.create(
  title: 'sheriff',
  name: 'Jaxson',
  description: LoremIpsum.lorem_ipsum(words: 25),
  quote: LoremIpsum.lorem_ipsum(words: 25)
)

jaxson.image.attach(
  io: Rails.root.join('app/assets/images/game/jaxson.svg').open,
  filename: 'jaxson.svg'
)
