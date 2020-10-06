# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'inspections/edit', type: :view do
  before(:each) do
    @bridge = assign(:bridge, FactoryBot.create(:bridge))
    @inspection = assign(:inspection, FactoryBot.create(:inspection, bridge: @bridge))
  end

  it 'renders the edit inspection form' do
    render

    assert_select 'form[action=?][method=?]', bridge_inspection_path(@bridge, @inspection), 'post' do
    end
  end
end
