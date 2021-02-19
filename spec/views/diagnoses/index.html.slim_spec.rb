# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'diagnoses/index', type: :view do
  before(:each) do
    regular_inspection = FactoryBot.create(:regular_inspection)
    assign(:regular_inspection, regular_inspection)
    assign(:diagnoses, [
             FactoryBot.create(:diagnosis, regular_inspection: regular_inspection),
             FactoryBot.create(:diagnosis,
                               regular_inspection: regular_inspection,
                               component_category: Component.categories[:superstructure_horizontal_grider])
           ])
  end

  it 'renders a list of diagnoses' do
    render
  end
end
