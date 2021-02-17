# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bridge_contents/show', type: :view do
  before(:each) do
    regular_inspection = assign(:regular_inspection, FactoryBot.create(:regular_inspection))
    assign(:bridge_content, FactoryBot.create(:bridge_content, regular_inspection: regular_inspection))
  end

  it 'renders attributes in <p>' do
    render
  end
end
