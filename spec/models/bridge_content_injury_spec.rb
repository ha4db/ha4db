# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BridgeContentInjury, type: :model do
  before do
    regular_inspection = FactoryBot.create(:regular_inspection)
    injury = FactoryBot.create(:injury, regular_inspection: regular_inspection)
    bridge_content = FactoryBot.create(:bridge_content, regular_inspection: regular_inspection)
    @bridge_content_injury = FactoryBot.create(:bridge_content_injury, bridge_content: bridge_content, injury: injury)
  end

  subject { @bridge_content_injury }

  it { should respond_to(:injury) }
  it { should respond_to(:bridge_content) }

  it { should be_valid }

  describe 'when result to two, it to be invalid' do
    before do
      @bridge_content_injury.injury = FactoryBot.create(:injury)
    end
    it { should_not be_valid }
  end
end
