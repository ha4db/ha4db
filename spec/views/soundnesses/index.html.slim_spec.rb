# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'soundnesses/index', type: :view do
  before(:each) do
    bridge = FactoryBot.create(:bridge)
    assign(:bridge, bridge)
    assign(:soundnesses, [
             FactoryBot.create(:soundness, bridge: bridge),
             FactoryBot.create(:soundness, bridge: bridge)
           ])
  end

  it 'renders a list of soundnesses' do
    render
  end
end
