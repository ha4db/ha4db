# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe InspectionsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/bridges/1/inspections').to route_to('inspections#index', bridge_id: '1')
    end

    it 'routes to #new' do
      expect(get: '/bridges/1/inspections/new').to route_to('inspections#new', bridge_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/bridges/1/inspections/1').to route_to('inspections#show', bridge_id: '1', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/bridges/1/inspections/1/edit').to route_to('inspections#edit', bridge_id: '1', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/bridges/1/inspections').to route_to('inspections#create', bridge_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/bridges/1/inspections/1').to route_to('inspections#update', bridge_id: '1', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/bridges/1/inspections/1').to route_to('inspections#update', bridge_id: '1', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/bridges/1/inspections/1').to route_to('inspections#destroy', bridge_id: '1', id: '1')
    end
  end
end
# rubocop:enable Metrics/BlockLength
