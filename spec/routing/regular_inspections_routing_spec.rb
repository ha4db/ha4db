# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe RegularInspectionsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/regular_inspections').to route_to('regular_inspections#index')
    end

    it 'routes to #new' do
      expect(get: '/regular_inspections/new').to route_to('regular_inspections#new')
    end

    it 'routes to #show' do
      expect(get: '/regular_inspections/1').to route_to('regular_inspections#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/regular_inspections/1/edit').to route_to('regular_inspections#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/regular_inspections').to route_to('regular_inspections#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/regular_inspections/1').to route_to('regular_inspections#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/regular_inspections/1').to route_to('regular_inspections#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/regular_inspections/1').to route_to('regular_inspections#destroy', id: '1')
    end

    it 'routes to #download_image_metadata' do
      expect(
        get: '/regular_inspections/1/download_image_metadata'
      ).to route_to('regular_inspections#download_image_metadata', regular_inspection_id: '1')
    end

    it 'routes to #download_pointcloud_metadata' do
      expect(
        get: '/regular_inspections/1/download_pointcloud_metadata'
      ).to route_to('regular_inspections#download_pointcloud_metadata', regular_inspection_id: '1')
    end
  end
end
# rubocop:enable Metrics/BlockLength
