# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bridge_content_injuries/edit', type: :view do
  before(:each) do
    @regular_inspection = assign(:regular_inspection, FactoryBot.create(:regular_inspection))
    @bridge_content = FactoryBot.create(:bridge_content, regular_inspection: @regular_inspection)
    @injury = assign(:injury, FactoryBot.create(:injury, regular_inspection: @regular_inspection))
    @bridge_content_injury = assign(:bridge_content_injury,
                                    FactoryBot.create(:bridge_content_injury,
                                                      bridge_content: @bridge_content,
                                                      injury: @injury))
  end

  it 'renders the edit bridge_content_injury form' do
    render

    assert_select 'form[action=?][method=?]',
                  regular_inspection_injury_bridge_content_injury_path(@regular_inspection,
                                                                       @injury,
                                                                       @bridge_content_injury), 'post' do
    end
  end
end
