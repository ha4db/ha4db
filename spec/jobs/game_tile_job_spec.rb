# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GameTileJob, type: :job do
  describe 'create' do
    before do
      @bridge_content = FactoryBot.create(:bridge_content,
                                          data: Rails.root.join('spec', 'testdata', 'ortho_image.png'),
                                          data_type: BridgeContent.data_types[:ortho])
      GameTileJob.perform_now(@bridge_content.id)
    end
    it '8/0_0.png' do
      expect(Dir).to exist(File.join('/tmp', 'ortho_images', @bridge_content.id.to_s))
      check_file = File.join('/tmp', 'ortho_images', @bridge_content.id.to_s, '8/0_0.png')
      expect(File).to exist(check_file)
    end

    it 'metadata' do
      @bridge_content.reload
      expect(@bridge_content.ortho_tile_info['min_zoom']).to eq(8)
      expect(@bridge_content.ortho_tile_info['max_zoom']).to eq(10)
    end
  end
end
