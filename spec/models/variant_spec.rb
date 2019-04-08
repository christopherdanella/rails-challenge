require 'rails_helper'

RSpec.describe Variant, type: :model do
  it { is_expected.to belong_to :product }
  it { is_expected.to have_many(:orders).through(:variations) }
end
