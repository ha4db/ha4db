# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'soundnesses/new', type: :view do
  before(:each) do
    @bridge = assign(:bridge, FactoryBot.create(:bridge))
    assign(:soundness, Soundness.new)
  end

  it 'renders new soundness form' do
    render

    assert_select 'form[action=?][method=?]', bridge_soundnesses_path(@bridge), 'post' do
    end
  end
end
