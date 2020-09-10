# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'MlitImporters', type: :request do
  before do
    @user = FactoryBot.create(:user)
    allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return({ user_id: @user.id })
  end

  describe 'GET /new' do
    it 'returns http success' do
      get new_mlit_importer_url
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /preview' do
    it 'returns http success' do
      post preview_mlit_importer_url
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      post mlit_importer_url
      expect(response).to have_http_status(:success)
    end
  end
end
