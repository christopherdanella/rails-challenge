FactoryBot.define do
  factory :customer do
    sequence(:name) { |c| "Customer #{c}" }
    sequence(:email) { |c| "customer#{c}@gmail.com" }
  end
end
