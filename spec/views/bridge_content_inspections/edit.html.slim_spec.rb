# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bridge_content_inspections/edit', type: :view do
  before(:each) do
    @bridge = assign(:bridge, FactoryBot.create(:bridge))
    @bridge_content = assign(:bridge_content, FactoryBot.create(:bridge_content, bridge: @bridge))
    @bridge_content_inspection = assign(:bridge_content_inspection,
                                        FactoryBot.create(:bridge_content_inspection, bridge_content: @bridge_content))
    assign(:inspection, @bridge_content_inspection.inspection)
  end

  it 'renders the edit bridge_content_inspection form' do
    render

    assert_select 'form[action=?][method=?]',
                  bridge_bridge_content_inspections_path(@bridge, @bridge_content, @bridge_content_inspection),
                  'post' do
    end
  end
end
