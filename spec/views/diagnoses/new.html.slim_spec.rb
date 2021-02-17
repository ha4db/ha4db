# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'diagnoses/new', type: :view do
  before(:each) do
    @regular_inspection = FactoryBot.create(:regular_inspection)
    assign(:regular_inspection, @regular_inspection)
    assign(:diagnosis, Diagnosis.new)
  end

  it 'renders new diagnosis form' do
    render

    assert_select 'form[action=?][method=?]', regular_inspection_diagnoses_path(@regular_inspection), 'post' do
    end
  end
end
