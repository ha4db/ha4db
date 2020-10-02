# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bridge_contents/new', type: :view do
  before(:each) do
    @bridge = FactoryBot.create(:bridge)
    assign(:bridge, @bridge)
    assign(:bridge_content, BridgeContent.new(bridge: @bridge))
  end

  it 'renders new bridge_content form' do
    render

    assert_select 'form[action=?][method=?]', bridge_bridge_contents_path(@bridge), 'post' do
    end
  end
end
