# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'soundnesses/show', type: :view do
  before(:each) do
    @bridge = assign(:bridge, FactoryBot.create(:bridge))
    @soundness = assign(:soundness, FactoryBot.create(:soundness, bridge: @bridge))
  end

  it 'renders attributes in <p>' do
    render
  end
end
