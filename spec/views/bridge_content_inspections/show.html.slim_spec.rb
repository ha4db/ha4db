# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bridge_content_inspections/show', type: :view do
  before(:each) do
    bridge = assign(:bridge, FactoryBot.create(:bridge))
    bridge_content = assign(:bridge_content, FactoryBot.create(:bridge_content, bridge: bridge))
    bridge_content_inspection = assign(:bridge_content_inspection,
                                       FactoryBot.create(:bridge_content_inspection, bridge_content: bridge_content))
    assign(:inspection, bridge_content_inspection.inspection)
  end

  it 'renders attributes in <p>' do
    render
  end
end
