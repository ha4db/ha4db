require 'rails_helper'

RSpec.describe 'injuries/edit', type: :view do
  before(:each) do
    @injury = assign(:injury, Injury.create!)
  end

  it 'renders the edit injury form' do
    render

    assert_select 'form[action=?][method=?]', injury_path(@injury), 'post' do
    end
  end
end
