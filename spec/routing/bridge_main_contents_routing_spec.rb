# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BridgeMainContentsController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(
        post: '/regular_inspections/1/bridge_main_contents'
      ).to route_to('bridge_main_contents#create', regular_inspection_id: '1')
    end

    it 'routes to #destroy' do
      expect(
        delete: '/regular_inspections/1/bridge_main_contents/1'
      ).to route_to('bridge_main_contents#destroy', regular_inspection_id: '1', id: '1')
    end
  end
end
