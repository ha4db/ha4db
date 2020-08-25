# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin::Tops', type: :request do
  before do
    @admin_user = FactoryBot.create(:admin_user)
    allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return({ admin_user_id: @admin_user.id })
  end
  describe 'GET /admin/top/index' do
    it 'enable to access' do
      get admin_top_index_path
      expect(response).to have_http_status(200)
    end

    it 'fail without login' do
      allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return({ admin_user_id: '' })
      get admin_top_index_path
      expect(response).to redirect_to admin_sessions_index_path
    end
  end
end
