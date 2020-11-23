FactoryBot.define do
  factory :timer do
    # Association
    association :minitask

    time {Faker::Date.between(from: 2.days.ago, to: Date.today)}
  end
end
