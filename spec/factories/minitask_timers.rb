FactoryBot.define do
  factory :minitask_timer do
    name {Faker::Name.last_name}
    text {Faker::Name.name}
    time {Faker::Date.between(from: 2.days.ago, to: Date.today)}
    task_id {Faker::Number.number(digits: 3)}
  end
end
