# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bridge_contents/index', type: :view do
  before(:each) do
    bridge = FactoryBot.create(:bridge)
    assign(:bridge, bridge)
    assign(:bridge_contents, [
             FactoryBot.create(:bridge_content, bridge: bridge),
             FactoryBot.create(:bridge_content, bridge: bridge)
           ])
  end

  it 'renders a list of bridge_contents' do
    render
  end
end
