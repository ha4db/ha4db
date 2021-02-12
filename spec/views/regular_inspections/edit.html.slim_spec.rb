# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'regular_inspections/edit', type: :view do
  before(:each) do
    @regular_inspection = assign(:regular_inspection, RegularInspection.create!)
  end

  it 'renders the edit regular_inspection form' do
    render

    assert_select 'form[action=?][method=?]', regular_inspection_path(@regular_inspection), 'post' do
    end
  end
end
