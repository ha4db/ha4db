# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'regular_inspections/show', type: :view do
  before(:each) do
    @regular_inspection = assign(:regular_inspection, RegularInspection.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
