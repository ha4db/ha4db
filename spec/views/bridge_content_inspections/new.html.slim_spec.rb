# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bridge_content_inspections/new', type: :view do
  before(:each) do
    @bridge = assign(:bridge, FactoryBot.create(:bridge))
    @bridge_content = assign(:bridge_content, FactoryBot.create(:bridge_content, bridge: @bridge))
    bridge_content_inspection = assign(:bridge_content_inspection,
                                       BridgeContentInspection.new(bridge_content: @bridge_content))
    assign(:inspection, bridge_content_inspection.build_inspection(bridge: @bridge))
  end

  it 'renders new bridge_content_inspection form' do
    render

    assert_select 'form[action=?][method=?]',
                  bridge_bridge_content_bridge_content_inspections_path(@bridge, @bridge_content), 'post' do
    end
  end
end
