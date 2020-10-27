# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BridgeContentInspectionsInspectionsController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(
        get: '/bridges/1/bridge_contents/1/inspections/1/new'
      ).to route_to('bridge_content_inspections_inspections#new',
                    bridge_id: '1',
                    bridge_content_id: '1',
                    inspection_id: '1')
    end

    it 'routes to #create' do
      expect(
        post: '/bridges/1/bridge_contents/1/inspections/1/create'
      ).to route_to('bridge_content_inspections_inspections#create',
                    bridge_id: '1',
                    bridge_content_id: '1',
                    inspection_id: '1')
    end
  end
end
