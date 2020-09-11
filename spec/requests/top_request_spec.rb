# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tops', type: :request do
  before do
    @user = FactoryBot.create(:user)
    allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return({ user_id: @user.id })
  end
  describe 'GET /top/index' do
    it 'enable to access' do
      get top_index_path
      expect(response).to have_http_status(200)
    end

    it 'fail without login' do
      allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return({ user_id: '' })
      get top_index_path
      expect(response).to redirect_to sessions_index_path
    end
  end
end
