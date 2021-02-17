# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'regular_inspections/new', type: :view do
  before(:each) do
    assign(:regular_inspection, RegularInspection.new)
  end

  it 'renders new regular_inspection form' do
    render

    assert_select 'form[action=?][method=?]', regular_inspections_path, 'post' do
    end
  end
end
