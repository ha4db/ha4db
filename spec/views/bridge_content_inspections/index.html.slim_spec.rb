# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bridge_content_inspections/index', type: :view do
  before(:each) do
    bridge = assign(:bridge, FactoryBot.create(:bridge))
    bridge_content = assign(:bridge_content, FactoryBot.create(:bridge_content, bridge: bridge))
    assign(:bridge_content_inspections, [
             FactoryBot.create(:bridge_content_inspection, bridge_content: bridge_content),
             FactoryBot.create(:bridge_content_inspection, bridge_content: bridge_content)
           ])
  end

  it 'renders a list of bridge_content_inspections' do
    render
  end
end
