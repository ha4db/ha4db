# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bridge_content_injuries/show', type: :view do
  before(:each) do
    regular_inspection = assign(:regular_inspection, FactoryBot.create(:regular_inspection))
    bridge_content = FactoryBot.create(:bridge_content, regular_inspection: regular_inspection)
    injury = assign(:injury, FactoryBot.create(:injury, regular_inspection: regular_inspection))
    assign(:bridge_content_injury,
           FactoryBot.create(:bridge_content_injury, bridge_content: bridge_content, injury: injury))
  end

  it 'renders attributes in <p>' do
    render
  end
end
