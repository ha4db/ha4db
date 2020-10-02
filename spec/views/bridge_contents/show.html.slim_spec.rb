# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bridge_contents/show', type: :view do
  before(:each) do
    @bridge = assign(:bridge, FactoryBot.create(:bridge))
    @bridge_content = assign(:bridge_content, FactoryBot.create(:bridge_content, bridge: @bridge))
  end

  it 'renders attributes in <p>' do
    render
  end
end
