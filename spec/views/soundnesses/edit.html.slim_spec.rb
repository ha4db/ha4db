# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'soundnesses/edit', type: :view do
  before(:each) do
    @bridge = assign(:bridge, FactoryBot.create(:bridge))
    @soundness = assign(:soundness, FactoryBot.create(:soundness, bridge: @bridge))
  end

  it 'renders the edit soundness form' do
    render

    assert_select 'form[action=?][method=?]', bridge_soundness_path(@bridge, @soundness), 'post' do
    end
  end
end
