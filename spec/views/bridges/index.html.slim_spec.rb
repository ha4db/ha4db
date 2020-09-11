# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bridges/index', type: :view do
  before(:each) do
    assign(:bridges, [
             Bridge.create!,
             Bridge.create!
           ])
  end

  it 'renders a list of bridges' do
    render
  end
end
