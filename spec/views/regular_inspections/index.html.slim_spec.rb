# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'regular_inspections/index', type: :view do
  before(:each) do
    bridge = assign(:bridge, FactoryBot.create(:bridge))
    assign(:regular_inspections, [
             RegularInspection.create!(bridge: bridge),
             RegularInspection.create!(bridge: bridge)
           ])
  end

  it 'renders a list of regular_inspections' do
    render
  end
end
