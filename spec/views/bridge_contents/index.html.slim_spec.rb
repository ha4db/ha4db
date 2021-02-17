# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bridge_contents/index', type: :view do
  before(:each) do
    regular_inspection = assign(:regular_inspection, FactoryBot.create(:regular_inspection))
    assign(:bridge_contents, [
             FactoryBot.create(:bridge_content, regular_inspection: regular_inspection),
             FactoryBot.create(:bridge_content, regular_inspection: regular_inspection)
           ])
  end

  it 'renders a list of bridge_contents' do
    render
  end
end
