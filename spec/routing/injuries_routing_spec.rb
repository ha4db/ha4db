# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe InjuriesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/regular_inspections/1/injuries').to route_to('injuries#index', regular_inspection_id: '1')
    end

    it 'routes to #new' do
      expect(get: '/regular_inspections/1/injuries/new').to route_to('injuries#new', regular_inspection_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/regular_inspections/1/injuries/1').to route_to('injuries#show', regular_inspection_id: '1', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/regular_inspections/1/injuries/1/edit').to route_to('injuries#edit',
                                                                        regular_inspection_id: '1',
                                                                        id: '1')
    end

    it 'routes to #create' do
      expect(post: '/regular_inspections/1/injuries').to route_to('injuries#create', regular_inspection_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/regular_inspections/1/injuries/1').to route_to('injuries#update',
                                                                   regular_inspection_id: '1',
                                                                   id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/regular_inspections/1/injuries/1').to route_to('injuries#update',
                                                                     regular_inspection_id: '1',
                                                                     id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/regular_inspections/1/injuries/1').to route_to('injuries#destroy',
                                                                      regular_inspection_id: '1',
                                                                      id: '1')
    end
  end
end
# rubocop:enable Metrics/BlockLength
