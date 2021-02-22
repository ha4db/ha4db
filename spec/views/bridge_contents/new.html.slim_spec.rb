# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bridge_contents/new', type: :view do
  before(:each) do
    assign(:components, [])
    @regular_inspection = FactoryBot.create(:regular_inspection)
    assign(:regular_inspection, @regular_inspection)
    assign(:bridge_content, BridgeContent.new(regular_inspection: @regular_inspection))
  end

  it 'renders new bridge_content form' do
    render

    assert_select 'form[action=?][method=?]', regular_inspection_bridge_contents_path(@regular_inspection), 'post' do
    end
  end
end
