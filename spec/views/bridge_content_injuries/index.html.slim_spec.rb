# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bridge_content_injuries/index', type: :view do
  before(:each) do
    regular_inspection = assign(:regular_inspection, FactoryBot.create(:regular_inspection))
    bridge_content1 = FactoryBot.create(:bridge_content, regular_inspection: regular_inspection)
    bridge_content2 = FactoryBot.create(:bridge_content, regular_inspection: regular_inspection)
    injury = assign(:injury, FactoryBot.create(:injury, regular_inspection: regular_inspection))
    assign(:bridge_content_injuries, [
             FactoryBot.create(:bridge_content_injury, bridge_content: bridge_content1, injury: injury),
             FactoryBot.create(:bridge_content_injury, bridge_content: bridge_content2, injury: injury)
           ])
  end

  it 'renders a list of bridge_content_injuries' do
    render
  end
end
