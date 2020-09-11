# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bridges/index', type: :view do
  before(:each) do
    assign(:bridges, [
             FactoryBot.create(:bridge),
             FactoryBot.create(:bridge)
           ])
  end

  it 'renders a list of bridges' do
    render
  end
end
