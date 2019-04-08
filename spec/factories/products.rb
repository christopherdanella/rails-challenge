FactoryBot.define do
  factory :product do
    sequence(:name) { |p| "Product #{p}"} 
  end
end
