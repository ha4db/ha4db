# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'injuries/edit', type: :view do
  before(:each) do
    bridge = FactoryBot.create(:bridge)
    @regular_inspection = FactoryBot.create(:regular_inspection, bridge: bridge)
    assign(:components, [])
    assign(:regular_inspection, @regular_inspection)
    assign(:injury, Injury.new(regular_inspection: @regular_inspection))
  end

  it 'renders the edit injury form' do
    render

    assert_select 'form[action=?][method=?]', regular_inspection_injuries_path(@regular_inspection), 'post' do
    end
  end
end
