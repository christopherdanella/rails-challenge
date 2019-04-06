require 'rails_helper'

RSpec.describe Variation, type: :model do
  it { is_expected.to belong_to :order }
  it { is_expected.to belong_to :variant }
end
