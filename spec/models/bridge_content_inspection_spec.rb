# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe BridgeContentInspection, type: :model do
  before do
    @bridge_content_inspection = FactoryBot.build(:bridge_content_inspection)
  end

  subject { @bridge_content_inspection }

  it { should respond_to(:data) }
  it { should respond_to(:bridge_content) }
  it { should respond_to(:inspection) }
  it { should respond_to(:seek) }
  it { should respond_to(:position) }
  it { should be_valid }

  describe 'create_inspection method' do
    before do
      @bridge_content_inspection.inspection = nil
    end

    describe 'with valid values' do
      it 'enable to create inspection' do
        inspection = FactoryBot.build(:inspection)
        inspection.bridge = nil
        inspection_params = inspection.attributes
        bridge_content_inspection_params = { seek: 15 }
        result = @bridge_content_inspection.create_inspection(bridge_content_inspection_params, inspection_params)
        expect(@bridge_content_inspection.inspection).to be_present
        expect(@bridge_content_inspection.inspection.id).to be_present
        expect(@bridge_content_inspection.seek).to eq 15
        expect(result).to eq @bridge_content_inspection.inspection
      end

      it 'count up inspection' do
        inspection = FactoryBot.build(:inspection)
        inspection_params = inspection.attributes
        bridge_content_inspection_params = { seek: 15 }
        expect do
          @bridge_content_inspection.create_inspection(bridge_content_inspection_params, inspection_params)
        end.to change(Inspection, :count).by(2) # it may FactoryBot bug
      end

      it 'count up bridge_content_inspection' do
        inspection = FactoryBot.build(:inspection)
        inspection_params = inspection.attributes
        bridge_content_inspection_params = { seek: 15 }
        expect do
          @bridge_content_inspection.create_inspection(bridge_content_inspection_params, inspection_params)
        end.to change(BridgeContentInspection, :count).by(1)
      end
    end

    describe 'with invalid inspect values' do
      it 'to be fail' do
        inspection = FactoryBot.build(:inspection)
        inspection.title = nil
        inspection_params = inspection.attributes
        bridge_content_inspection_params = { seek: 15 }
        new_inspection = @bridge_content_inspection.create_inspection(bridge_content_inspection_params,
                                                                      inspection_params)
        expect(@bridge_content_inspection.inspection).to eq nil
        expect(@bridge_content_inspection.seek).to eq 10
        expect(new_inspection).not_to eq nil
      end

      it 'dont count up inspection' do
        inspection = FactoryBot.build(:inspection)
        inspection.title = nil
        inspection_params = inspection.attributes
        bridge_content_inspection_params = { seek: 15 }
        expect do
          @bridge_content_inspection.create_inspection(bridge_content_inspection_params, inspection_params)
        end.to change(Inspection, :count).by(0)
      end

      it 'dont count up bridge_content_inspection' do
        inspection = FactoryBot.build(:inspection)
        inspection.title = nil
        inspection_params = inspection.attributes
        bridge_content_inspection_params = { seek: 15 }
        expect do
          @bridge_content_inspection.create_inspection(bridge_content_inspection_params, inspection_params)
        end.to change(BridgeContentInspection, :count).by(0)
      end
    end

    describe 'with invalid bridge_content_inspection value' do
      it 'to be fail' do
        inspection = FactoryBot.build(:inspection)
        inspection_params = inspection.attributes
        bridge_content_inspection_params = { seek: 'fail value' }
        new_inspection = @bridge_content_inspection.create_inspection(bridge_content_inspection_params,
                                                                      inspection_params)
        expect(@bridge_content_inspection.inspection).not_to eq nil
        expect(new_inspection).not_to eq nil
      end

      it 'dont count up inspection' do
        inspection = FactoryBot.build(:inspection)
        inspection_params = inspection.attributes
        bridge_content_inspection_params = { seek: 'fail value' }
        expect do
          @bridge_content_inspection.create_inspection(bridge_content_inspection_params, inspection_params)
        end.to change(Inspection, :count).by(0)
      end

      it 'dont count up bridge_content_inspection' do
        inspection = FactoryBot.build(:inspection)
        inspection_params = inspection.attributes
        bridge_content_inspection_params = { seek: 'fail value' }
        expect do
          @bridge_content_inspection.create_inspection(bridge_content_inspection_params, inspection_params)
        end.to change(BridgeContentInspection, :count).by(0)
      end
    end
  end

  describe 'duplicate' do
    before do
      @bridge_content_inspection.save
    end

    it 'cannot save same object' do
      new_bridge_content_inspection = FactoryBot.build(:bridge_content_inspection)
      new_bridge_content_inspection.bridge_content = @bridge_content_inspection.bridge_content
      new_bridge_content_inspection.inspection = @bridge_content_inspection.inspection
      expect(new_bridge_content_inspection.save).to eq false
    end
  end
end
# rubocop:enable Metrics/BlockLength
