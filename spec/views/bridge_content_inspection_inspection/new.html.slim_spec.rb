# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bridge_content_inspections_inspections/new.html.slim', type: :view do
  before(:each) do
    @bridge = assign(:bridge, FactoryBot.create(:bridge))
    @bridge_content = assign(:bridge_content, FactoryBot.create(:bridge_content, bridge: @bridge))
    @inspection = assign(:inspection, FactoryBot.create(:inspection, bridge: @bridge))
    assign(:bridge_content_inspection, BridgeContentInspection.new(bridge_content: @bridge_content))
  end

  it 'renders new bridge_content_inspection form' do
    render

    assert_select 'form[action=?][method=?]',
                  url_for(controller: :bridge_content_inspections_inspections,
                          action: :create,
                          bridge_id: @bridge.id,
                          bridge_content_id: @bridge_content.id,
                          inspection_id: @inspection.id), 'post' do
    end
  end
end
