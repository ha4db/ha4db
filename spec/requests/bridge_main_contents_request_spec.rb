# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'BridgeMainContents', type: :request do
  before do
    @user = FactoryBot.create(:user)
    allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return({ user_id: @user.id })
    @bridge = FactoryBot.create(:bridge)
    @regular_inspection = FactoryBot.create(:regular_inspection, bridge: @bridge)
    @bridge_content = FactoryBot.create(:bridge_content, regular_inspection: @regular_inspection)
  end

  # BridgeMainContent. As you add validations to BridgeMainContent, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    FactoryBot.build(:bridge_main_content,
                     bridge_content: @bridge_content).attributes
  end

  let(:invalid_attributes) do
    invalid_value = FactoryBot.build(:bridge_main_content)
    invalid_value.bridge_content = nil
    invalid_value.attributes
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Injury' do
        expect do
          post regular_inspection_bridge_main_contents_url(@regular_inspection),
               params: { bridge_main_content: valid_attributes }
        end.to change(BridgeMainContent, :count).by(1)
      end

      it 'redirects to bridge_contents index' do
        post regular_inspection_bridge_main_contents_url(@regular_inspection),
             params: { bridge_main_content: valid_attributes }
        expect(response).to redirect_to(regular_inspection_bridge_contents_url(@regular_inspection))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Injury' do
        expect do
          post regular_inspection_bridge_main_contents_url(@regular_inspection),
               params: { bridge_main_content: invalid_attributes }
        end.to change(BridgeMainContent, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post regular_inspection_bridge_main_contents_url(@regular_inspection),
             params: { bridge_main_content: invalid_attributes }
        expect(response).to redirect_to(regular_inspection_bridge_contents_url(@regular_inspection))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested bridge_main_content' do
      bridge_main_content = BridgeMainContent.create! valid_attributes
      expect do
        delete regular_inspection_bridge_main_content_url(@regular_inspection, bridge_main_content)
      end.to change(BridgeMainContent, :count).by(-1)
    end

    it 'redirects to the injuries list' do
      bridge_main_content = BridgeMainContent.create! valid_attributes
      delete regular_inspection_bridge_main_content_url(@regular_inspection, bridge_main_content)
      expect(response).to redirect_to(regular_inspection_bridge_contents_url(@regular_inspection))
    end
  end
end
# rubocop:enable Metrics/BlockLength
