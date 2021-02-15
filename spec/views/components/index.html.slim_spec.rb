# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'components/index', type: :view do
  before(:each) do
    bridge = FactoryBot.create(:bridge)
    assign(:components, [
             FactoryBot.create(:component, bridge: bridge),
             FactoryBot.create(:component, bridge: bridge)
           ])
  end

  it 'renders a list of components' do
    render
  end
end
