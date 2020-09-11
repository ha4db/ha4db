# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bridges/show', type: :view do
  before(:each) do
    @bridge = FactoryBot.create(:bridge)
  end

  it 'renders attributes in <p>' do
    render
  end
end
