# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'components/show', type: :view do
  before(:each) do
    bridge = assign(:bridge, FactoryBot.create(:bridge))
    @component = assign(:component, FactoryBot.create(:component, bridge: bridge))
  end

  it 'renders attributes in <p>' do
    render
  end
end
