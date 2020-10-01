# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'MlitImporters', type: :request do
  before do
    @user = FactoryBot.create(:user)
    allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return({ user_id: @user.id })
  end

  let(:valid_attributes) do
    file = File.join(File.dirname(__FILE__), '../testdata/mlit-testdata-001.xlsx')
    MlitImporter.import(file).attributes
  end

  let(:invalid_attributes) do
    file = File.join(File.dirname(__FILE__), '../testdata/mlit-testdata-001-invalid.xlsx')
    MlitImporter.import(file).attributes
  end

  describe 'GET /new' do
    it 'returns http success' do
      get new_mlit_importer_url
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /preview' do
    it 'returns http success' do
      file = File.join(File.dirname(__FILE__), '../testdata/mlit-testdata-001.xlsx')
      post preview_mlit_importer_url, params: {
        upload_file: Rack::Test::UploadedFile.new(file)
      }
      expect(response).to have_http_status(:success)
      expect(response.body).to include('bridge[title]')
    end

    it 'render new' do
      file = File.join(File.dirname(__FILE__), '../testdata/mlit-testdata-001-invalid.xlsx')
      post preview_mlit_importer_url, params: {
        upload_file: Rack::Test::UploadedFile.new(file)
      }
      expect(response).to have_http_status(:success)
      expect(response.body).to include('file')
    end
  end

  describe 'POST /create' do
    describe 'with valid data' do
      it 'creates a new Bridge' do
        expect do
          post mlit_importer_url, params: { bridge: valid_attributes }
        end.to change(Bridge, :count).by(1)
      end

      it 'redirects to the created bridge' do
        post mlit_importer_url, params: { bridge: valid_attributes }
        expect(response).to redirect_to(bridge_url(Bridge.last))
      end
    end

    describe 'with invalid data' do
      it 'cannot creates a new Bridge' do
        expect do
          post mlit_importer_url, params: { bridge: invalid_attributes }
        end.to change(Bridge, :count).by(0)
      end

      it 'render new page' do
        post mlit_importer_url, params: { bridge: invalid_attributes }
        expect(response.body).to include('file')
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
