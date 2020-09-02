# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/users/show', type: :view do
  before(:each) do
    @user = assign(:user, FactoryBot.create(:user))
  end

  it 'renders attributes in <p>' do
    render
  end
end
