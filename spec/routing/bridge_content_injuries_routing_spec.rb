# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe BridgeContentInjuriesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(
        get: '/regular_inspections/1/injuries/1/bridge_content_injuries'
      ).to route_to('bridge_content_injuries#index', regular_inspection_id: '1', injury_id: '1')
    end

    it 'routes to #new' do
      expect(
        get: '/regular_inspections/1/injuries/1/bridge_content_injuries/new'
      ).to route_to('bridge_content_injuries#new', regular_inspection_id: '1', injury_id: '1')
    end

    it 'routes to #show' do
      expect(
        get: '/regular_inspections/1/injuries/1/bridge_content_injuries/1'
      ).to route_to('bridge_content_injuries#show', regular_inspection_id: '1', injury_id: '1', id: '1')
    end

    it 'routes to #edit' do
      expect(
        get: '/regular_inspections/1/injuries/1/bridge_content_injuries/1/edit'
      ).to route_to('bridge_content_injuries#edit', regular_inspection_id: '1', injury_id: '1', id: '1')
    end

    it 'routes to #create' do
      expect(
        post: '/regular_inspections/1/injuries/1/bridge_content_injuries'
      ).to route_to('bridge_content_injuries#create', regular_inspection_id: '1', injury_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(
        put: '/regular_inspections/1/injuries/1/bridge_content_injuries/1'
      ).to route_to('bridge_content_injuries#update', regular_inspection_id: '1', injury_id: '1', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(
        patch: '/regular_inspections/1/injuries/1/bridge_content_injuries/1'
      ).to route_to('bridge_content_injuries#update', regular_inspection_id: '1', injury_id: '1', id: '1')
    end

    it 'routes to #destroy' do
      expect(
        delete: '/regular_inspections/1/injuries/1/bridge_content_injuries/1'
      ).to route_to('bridge_content_injuries#destroy', regular_inspection_id: '1', injury_id: '1', id: '1')
    end
  end
end
# rubocop:enable Metrics/BlockLength
