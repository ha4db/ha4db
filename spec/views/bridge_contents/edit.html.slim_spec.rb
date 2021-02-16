# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bridge_contents/edit', type: :view do
  before(:each) do
    @regular_inspection = assign(:regular_inspection, FactoryBot.create(:regular_inspection))
    @bridge_content = assign(:bridge_content,
                             FactoryBot.create(:bridge_content, regular_inspection: @regular_inspection))
  end

  it 'renders the edit bridge_content form' do
    render

    assert_select 'form[action=?][method=?]',
                  regular_inspection_bridge_content_path(@regular_inspection, @bridge_content), 'post' do
    end
  end
end
