# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Component, type: :model do
  before do
    @bridge = FactoryBot.create(:bridge)
    @component = FactoryBot.build(:component, bridge: @bridge)
  end

  subject { @component }

  it { should respond_to(:bridge) }
  it { should respond_to(:title) }
  it { should respond_to(:component_category) }

  it { should be_valid }

  describe 'when bridge is not present' do
    before { @component.bridge = nil }
    it { should_not be_valid }
  end
end
