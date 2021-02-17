# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'injuries/index', type: :view do
  before(:each) do
    bridge = FactoryBot.create(:bridge)
    @regular_inspection = FactoryBot.create(:regular_inspection, bridge: bridge)
    component1 = FactoryBot.create(:component, bridge: bridge)
    component2 = FactoryBot.create(:component, bridge: bridge)
    assign(:injuries, [
             FactoryBot.create(:injury, regular_inspection: @regular_inspection, component: component1),
             FactoryBot.create(:injury, regular_inspection: @regular_inspection, component: component2)
           ])
  end

  it 'renders a list of injuries' do
    render
  end
end
