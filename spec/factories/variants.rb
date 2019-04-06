FactoryBot.define do
  factory :variant do
    sequence(:name) { |v| "Variant #{v}" }
    sequence(:cost) {rand(0..100)}
    sequence(:weight) {rand(0..100)}
    product
  end
end
