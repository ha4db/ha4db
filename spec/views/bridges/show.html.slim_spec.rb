# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bridges/show', type: :view do
  before(:each) do
    @bridge = assign(:bridge, Bridge.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
