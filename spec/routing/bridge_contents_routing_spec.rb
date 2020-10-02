# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe BridgeContentsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/bridges/1/bridge_contents').to route_to('bridge_contents#index', bridge_id: '1')
    end

    it 'routes to #new' do
      expect(get: '/bridges/1/bridge_contents/new').to route_to('bridge_contents#new', bridge_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/bridges/1/bridge_contents/1').to route_to('bridge_contents#show', bridge_id: '1', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/bridges/1/bridge_contents/1/edit').to route_to('bridge_contents#edit', bridge_id: '1', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/bridges/1/bridge_contents').to route_to('bridge_contents#create', bridge_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/bridges/1/bridge_contents/1').to route_to('bridge_contents#update', bridge_id: '1', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/bridges/1/bridge_contents/1').to route_to('bridge_contents#update', bridge_id: '1', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/bridges/1/bridge_contents/1').to route_to('bridge_contents#destroy', bridge_id: '1', id: '1')
    end
  end
end
# rubocop:enable Metrics/BlockLength
