# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'diagnoses/edit', type: :view do
  before(:each) do
    @regular_inspection = FactoryBot.create(:regular_inspection)
    assign(:regular_inspection, @regular_inspection)
    @diagnosis = assign(:diagnosis, FactoryBot.create(:diagnosis, regular_inspection: @regular_inspection))
  end

  it 'renders the edit diagnosis form' do
    render

    assert_select 'form[action=?][method=?]',
                  regular_inspection_diagnosis_path(@regular_inspection, @diagnosis),
                  'post' do
    end
  end
end
