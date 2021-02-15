# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe ComponentsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/components').to route_to('components#index')
    end

    it 'routes to #new' do
      expect(get: '/components/new').to route_to('components#new')
    end

    it 'routes to #show' do
      expect(get: '/components/1').to route_to('components#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/components/1/edit').to route_to('components#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/components').to route_to('components#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/components/1').to route_to('components#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/components/1').to route_to('components#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/components/1').to route_to('components#destroy', id: '1')
    end
  end
end
# rubocop:enable Metrics/BlockLength
