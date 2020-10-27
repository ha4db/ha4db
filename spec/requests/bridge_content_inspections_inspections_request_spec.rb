# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'BridgeContentInspectionsInspections', type: :request do
  before do
    @user = FactoryBot.create(:user)
    allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return({ user_id: @user.id })
    @bridge = FactoryBot.create(:bridge)
    @bridge_content = FactoryBot.create(:bridge_content, bridge: @bridge)
    @inspection = FactoryBot.create(:inspection, bridge: @bridge)
  end

  let(:valid_attributes) do
    FactoryBot.build(:bridge_content_inspection, bridge_content: @bridge_content, inspection: @inspection).attributes
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get url_for(controller: :bridge_content_inspections_inspections,
                  action: :new,
                  bridge_id: @bridge.id,
                  bridge_content_id: @bridge_content.id,
                  inspection_id: @inspection.id)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new BridgeContentInspection' do
        expect do
          post url_for(controller: :bridge_content_inspections_inspections,
                       action: :create,
                       bridge_id: @bridge.id,
                       bridge_content_id: @bridge_content.id,
                       inspection_id: @inspection.id),
               params: { bridge_content_inspection: valid_attributes }
        end.to change(BridgeContentInspection, :count).by(1)
      end

      it 'redirects to the created bridge_content_inspection' do
        post url_for(controller: :bridge_content_inspections_inspections,
                     action: :create,
                     bridge_id: @bridge.id,
                     bridge_content_id: @bridge_content.id,
                     inspection_id: @inspection.id),
             params: { bridge_content_inspection: valid_attributes }
        expect(response).to redirect_to(
          bridge_bridge_content_bridge_content_inspection_url(@bridge,
                                                              @bridge_content,
                                                              BridgeContentInspection.last)
        )
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new BridgeContentInspection' do
        FactoryBot.create(:bridge_content_inspection, bridge_content: @bridge_content, inspection: @inspection)
        expect do
          post url_for(controller: :bridge_content_inspections_inspections,
                       action: :create,
                       bridge_id: @bridge.id,
                       bridge_content_id: @bridge_content.id,
                       inspection_id: @inspection.id),
               params: { bridge_content_inspection: valid_attributes }
        end.to change(BridgeContentInspection, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        FactoryBot.create(:bridge_content_inspection, bridge_content: @bridge_content, inspection: @inspection)
        post url_for(controller: :bridge_content_inspections_inspections,
                     action: :create, bridge_id: @bridge.id,
                     bridge_content_id: @bridge_content.id,
                     inspection_id: @inspection.id),
             params: { bridge_content_inspection: valid_attributes }
        expect(response).to be_successful
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
