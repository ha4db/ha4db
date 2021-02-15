require 'rails_helper'

RSpec.describe 'injuries/show', type: :view do
  before(:each) do
    @injury = assign(:injury, Injury.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
