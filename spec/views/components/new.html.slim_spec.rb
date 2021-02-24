# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'components/new', type: :view do
  before(:each) do
    @bridge = assign(:bridge, FactoryBot.create(:bridge))
    assign(:component, Component.new(bridge: @bridge))
  end

  it 'renders new component form' do
    render

    assert_select 'form[action=?][method=?]', bridge_components_path(@bridge), 'post' do
    end
  end
end
