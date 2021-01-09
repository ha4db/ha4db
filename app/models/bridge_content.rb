# frozen_string_literal: true

# BridgeContent Model
class BridgeContent < ApplicationRecord
  after_commit :pointcloud_update
  before_save :check_pointcloud_is_update
  after_commit :ortho_image_update
  before_save :check_ortho_is_update

  belongs_to :bridge
  has_many :bridge_content_inspections
  has_many :inspections, through: :bridge_content_inspections
  validates :title, presence: true
  has_one_attached :data
  validates :data, presence: true
  store_accessor :metadata, :data_type
  store_accessor :metadata, :ortho_tile_info
  store_accessor :metadata, :ortho_metadata
  store_accessor :metadata, :pointcloud_info
  store_accessor :metadata, :pointcloud_metadata

  enum data_type: {
    unselected: 0,
    image: 1,
    movie: 2,
    damage_diagram: 3,
    ortho: 4,
    pointcloud: 5
  }

  private

  def check_ortho_is_update
    return unless data_type.to_i == BridgeContent.data_types[:ortho]

    self.ortho_tile_info = nil if data.changed?
  end

  def ortho_image_update
    return unless data_type.to_i == BridgeContent.data_types[:ortho]

    GameTileJob.perform_later(id) if ortho_tile_info.nil?
  end

  def check_pointcloud_is_update
    return unless data_type.to_i == BridgeContent.data_types[:pointcloud]

    self.pointcloud_info = nil if data.changed?
  end

  def pointcloud_update
    return unless data_type.to_i == BridgeContent.data_types[:pointcloud]

    PointcloudJob.perform_later(id) if pointcloud_info.nil?
  end
end
