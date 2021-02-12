# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'regular_inspections/index', type: :view do
  before(:each) do
    assign(:regular_inspections, [
             RegularInspection.create!,
             RegularInspection.create!
           ])
  end

  it 'renders a list of regular_inspections' do
    render
  end
end
