FactoryBot.define do
  factory :genre do
    # Association
    association :user

    name {Faker::Name.last_name}
    text {Faker::Name.name}
  end
end
