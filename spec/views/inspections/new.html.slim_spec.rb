# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'inspections/new', type: :view do
  before(:each) do
    @bridge = assign(:bridge, FactoryBot.create(:bridge))
    assign(:inspection, Inspection.new)
  end

  it 'renders new inspection form' do
    render

    assert_select 'form[action=?][method=?]', bridge_inspections_path(@bridge), 'post' do
    end
  end
end
