# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/users/edit', type: :view do
  before(:each) do
    @user = assign(:user, FactoryBot.create(:user))
  end

  it 'renders the edit user form' do
    render
    puts(response.body)
    assert_select 'form[action=?][method=?]', admin_user_path(@user), 'post' do
    end
  end
end
