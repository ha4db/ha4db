# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bridges/new', type: :view do
  before(:each) do
    assign(:bridge, Bridge.new)
  end

  it 'renders new bridge form' do
    render

    assert_select 'form[action=?][method=?]', bridges_path, 'post' do
    end
  end
end
