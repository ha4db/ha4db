# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'regular_inspections/index', type: :view do
  before(:each) do
    bridge = assign(:bridge, FactoryBot.create(:bridge))
    assign(:regular_inspections, [
             FactoryBot.create(:regular_inspection, bridge: bridge),
             FactoryBot.create(:regular_inspection, bridge: bridge)
           ])
  end

  it 'renders a list of regular_inspections' do
    render
  end
end
