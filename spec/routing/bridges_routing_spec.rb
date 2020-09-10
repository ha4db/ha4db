# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe BridgesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/bridges').to route_to('bridges#index')
    end

    it 'routes to #new' do
      expect(get: '/bridges/new').to route_to('bridges#new')
    end

    it 'routes to #show' do
      expect(get: '/bridges/1').to route_to('bridges#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/bridges/1/edit').to route_to('bridges#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/bridges').to route_to('bridges#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/bridges/1').to route_to('bridges#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/bridges/1').to route_to('bridges#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/bridges/1').to route_to('bridges#destroy', id: '1')
    end
  end
end
# rubocop:enable Metrics/BlockLength
