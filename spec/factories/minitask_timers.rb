
FactoryBot.define do
  factory :minitask_timer do

  name {Faker::Name.last_name}
  text {Faker::Name.name}
  task_id {Faker::Number.number(digits: 2)}
  minitask_id {Faker::Number.number(digits: 2)}
  time {Faker::Date.between(from: 2.days.ago, to: Date.today)}

end
