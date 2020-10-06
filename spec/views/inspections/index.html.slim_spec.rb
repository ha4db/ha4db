# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'inspections/index', type: :view do
  before(:each) do
    bridge = FactoryBot.create(:bridge)
    assign(:bridge, bridge)
    assign(:inspections, [
             FactoryBot.create(:inspection, bridge: bridge),
             FactoryBot.create(:inspection, bridge: bridge)
           ])
  end

  it 'renders a list of inspections' do
    render
  end
end
