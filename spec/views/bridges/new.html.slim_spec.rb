# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bridges/new', type: :view do
  before(:each) do
    bridge = Bridge.new
    bridge.location = 'POINT(140.084556 36.104611)'
    assign(:bridge, bridge)
  end

  it 'renders new bridge form' do
    render

    assert_select 'form[action=?][method=?]', bridges_path, 'post' do
    end
  end
end
