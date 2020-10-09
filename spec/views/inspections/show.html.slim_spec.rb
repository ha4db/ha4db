# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'inspections/show', type: :view do
  before(:each) do
    @bridge = assign(:bridge, FactoryBot.create(:bridge))
    @inspection = assign(:inspection, FactoryBot.create(:inspection, bridge: @bridge))
  end

  it 'renders attributes in <p>' do
    render
  end
end
