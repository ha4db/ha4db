# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bridges/edit', type: :view do
  before(:each) do
    @bridge = FactoryBot.create(:bridge)
  end

  it 'renders the edit bridge form' do
    render

    assert_select 'form[action=?][method=?]', bridge_path(@bridge), 'post' do
    end
  end
end
