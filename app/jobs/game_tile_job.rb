# frozen_string_literal: true

# GameTileJob
class GameTileJob < ApplicationJob
  queue_as :default

  def perform(bridge_content_id)
    bridge_content = BridgeContent.find_by_id(bridge_content_id)
    return if bridge_content.nil?

    return unless bridge_content.data_type.to_i == BridgeContent.data_types[:ortho]

    exec_perform(bridge_content)
  end

  private

  def exec_perform(bridge_content)
    bridge_content.data.open do |file|
      target_dir = Rails.root.join('public', 'ortho_images', bridge_content.id.to_s)
      target_dir = File.join('/tmp', 'ortho_images', bridge_content.id.to_s) if Rails.env == 'test'
      FileUtils.rm_rf(target_dir)
      game_tile = GameTile.new(file.path, target_dir)
      zoom_range = game_tile.make
      bridge_content.ortho_tile_info = { min_zoom: zoom_range.first, max_zoom: zoom_range.last }
      bridge_content.save
    end
  end
end
