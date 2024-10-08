FactoryBot.define do
    factory :task do
      title { Faker::Lorem.characters(number: 10) }
      content { Faker::Lorem.characters(number: 100) }
      deadline { Faker::Date.between(from: Date.today, to: 30.days.from_now) }
    end
  end
