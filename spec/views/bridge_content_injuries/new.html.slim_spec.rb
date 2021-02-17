# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bridge_content_injuries/new', type: :view do
  before(:each) do
    @regular_inspection = assign(:regular_inspection, FactoryBot.create(:regular_inspection))
    @injury = assign(:injury, FactoryBot.create(:injury, regular_inspection: @regular_inspection))
    assign(:bridge_content_injury, BridgeContentInjury.new(injury: @injury))
  end

  it 'renders new bridge_content_injury form' do
    render

    assert_select 'form[action=?][method=?]',
                  regular_inspection_injury_bridge_content_injuries_path(@regular_inspection, @injury),
                  'post' do
    end
  end
end
