# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'components/new', type: :view do
  before(:each) do
    assign(:component, Component.new)
  end

  it 'renders new component form' do
    render

    assert_select 'form[action=?][method=?]', components_path, 'post' do
    end
  end
end
