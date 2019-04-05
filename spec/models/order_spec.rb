require 'rails_helper'

RSpec.describe Order, type: :model do
  it { is_expected.to belong_to :customer }
  it { is_expected.to validate_presence_of :customer } 
  it { should validate_inclusion_of(:status).in_array(Order::ORDER_STATUS) }

end
