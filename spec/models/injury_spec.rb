# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Injury, type: :model do
  before do
    @bridge = FactoryBot.create(:bridge)
    @component = FactoryBot.create(:component, bridge: @bridge)
    @regular_inspection = FactoryBot.create(:regular_inspection, bridge: @bridge)
    @injury = FactoryBot.create(:injury, regular_inspection: @regular_inspection, component: @component)
  end

  subject { @injury }

  it { should respond_to(:regular_inspection) }
  it { should respond_to(:component) }
  it { should respond_to(:injury_type) }
  it { should respond_to(:injury_grade) }

  it { should be_valid }

  describe 'when regular_inspection is not present' do
    before { @injury.regular_inspection = nil }
    it { should_not be_valid }
  end

  describe 'when component is not present' do
    before { @injury.component = nil }
    it { should_not be_valid }
  end
end
