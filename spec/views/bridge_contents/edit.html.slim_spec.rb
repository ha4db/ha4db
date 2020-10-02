# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bridge_contents/edit', type: :view do
  before(:each) do
    @bridge = assign(:bridge, FactoryBot.create(:bridge))
    @bridge_content = assign(:bridge_content, FactoryBot.create(:bridge_content, bridge: @bridge))
  end

  it 'renders the edit bridge_content form' do
    render

    assert_select 'form[action=?][method=?]', bridge_bridge_content_path(@bridge, @bridge_content), 'post' do
    end
  end
end
