FactoryBot.define do
  factory :minitask do
    name {Faker::Name.last_name}
    text {Faker::Name.name}
  end
end
