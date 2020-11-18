FactoryBot.define do
  factory :task do
    name {Faker::Name.last_name}
    text {Faker::Name.name}
  end
end
