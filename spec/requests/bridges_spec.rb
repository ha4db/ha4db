# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

# rubocop:disable Metrics/BlockLength
RSpec.describe '/bridges', type: :request do
  before do
    @user = FactoryBot.create(:user)
    allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return({ user_id: @user.id })
  end

  # Bridge. As you add validations to Bridge, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    FactoryBot.build(:bridge).attributes
  end

  let(:invalid_attributes) do
    bridge = FactoryBot.build(:bridge)
    bridge.title = ''
    bridge.attributes
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Bridge.create! valid_attributes
      get bridges_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      bridge = Bridge.create! valid_attributes
      get bridge_url(bridge)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_bridge_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      bridge = Bridge.create! valid_attributes
      get edit_bridge_url(bridge)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Bridge' do
        expect do
          post bridges_url, params: { bridge: valid_attributes }
        end.to change(Bridge, :count).by(1)
      end

      it 'redirects to the created bridge' do
        post bridges_url, params: { bridge: valid_attributes }
        expect(response).to redirect_to(bridge_url(Bridge.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Bridge' do
        expect do
          post bridges_url, params: { bridge: invalid_attributes }
        end.to change(Bridge, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post bridges_url, params: { bridge: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        FactoryBot.build(:bridge).attributes
      end

      it 'updates the requested bridge' do
        new_params = new_attributes
        bridge = Bridge.create! valid_attributes
        patch bridge_url(bridge), params: { bridge: new_params }
        bridge.reload
        expect(bridge.title).to eq(new_params['title'])
      end

      it 'redirects to the bridge' do
        bridge = Bridge.create! valid_attributes
        patch bridge_url(bridge), params: { bridge: new_attributes }
        bridge.reload
        expect(response).to redirect_to(bridge_url(bridge))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        bridge = Bridge.create! valid_attributes
        patch bridge_url(bridge), params: { bridge: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested bridge' do
      bridge = Bridge.create! valid_attributes
      expect do
        delete bridge_url(bridge)
      end.to change(Bridge, :count).by(-1)
    end

    it 'redirects to the bridges list' do
      bridge = Bridge.create! valid_attributes
      delete bridge_url(bridge)
      expect(response).to redirect_to(bridges_url)
    end
  end

  describe 'GET /bridge_id/download_image_metadata' do
    it 'download simple template' do
      bridge = Bridge.create! valid_attributes
      get bridge_download_image_metadata_url(bridge)
      expect(response).to be_successful
    end
  end

  describe 'GET /bridge_id/download_pointcloud_metadata' do
    it 'download simple template' do
      bridge = Bridge.create! valid_attributes
      get bridge_download_pointcloud_metadata_url(bridge)
      expect(response).to be_successful
    end
  end
end
# rubocop:enable Metrics/BlockLength
