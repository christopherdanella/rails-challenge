FactoryBot.define do
  factory :order do
    sequence(:status) { "pending" }
  end
end
