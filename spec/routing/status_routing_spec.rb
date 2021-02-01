# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StatusController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/status.json').to route_to('status#index', format: "json")
    end
  end
end
