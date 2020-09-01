# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/users/index', type: :view do
  before(:each) do
    assign(:users, [
             FactoryBot.create(:user),
             FactoryBot.create(:user)
           ])
  end

  it 'renders a list of admin/users' do
    render
  end
end
