# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'regular_inspections/show', type: :view do
  before(:each) do
    bridge = assign(:bridge, FactoryBot.create(:bridge))
    @regular_inspection = assign(:regular_inspection, FactoryBot.create(:regular_inspection, bridge: bridge))
  end

  it 'renders attributes in <p>' do
    render
  end
end
