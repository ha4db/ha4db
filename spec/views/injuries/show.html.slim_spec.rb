# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'injuries/show', type: :view do
  before(:each) do
    bridge = FactoryBot.create(:bridge)
    regular_inspection = FactoryBot.create(:regular_inspection, bridge: bridge)
    component = FactoryBot.create(:component, bridge: bridge)
    assign(:regular_inspection, regular_inspection)
    @injury = assign(:injury, FactoryBot.create(:injury, regular_inspection: regular_inspection, component: component))
  end

  it 'renders attributes in <p>' do
    render
  end
end
