# frozen_string_literal: true

require 'exifr/jpeg'

# rubocop:disable Metrics/ClassLength
# BridgeContent Model
class BridgeContent < ApplicationRecord
  after_commit :pointcloud_update
  before_save :check_pointcloud_is_update
  after_commit :ortho_image_update
  before_save :check_ortho_is_update
  after_commit :check_image_has_exif

  belongs_to :regular_inspection
  belongs_to :component, optional: true
  has_one :bridge_main_content
  has_one :bridge_content_injury
  validates :title, presence: true
  has_one_attached :data
  validates :data, presence: true
  store_accessor :metadata, :data_type
  store_accessor :metadata, :ortho_tile_info
  store_accessor :metadata, :ortho_metadata
  store_accessor :metadata, :pointcloud_info
  store_accessor :metadata, :pointcloud_metadata
  # image metadata
  store_accessor :metadata, :position_entry_type
  store_accessor :metadata, :center_x
  store_accessor :metadata, :center_y
  store_accessor :metadata, :center_z
  store_accessor :metadata, :euler_angle_alpha
  store_accessor :metadata, :euler_angle_beta
  store_accessor :metadata, :euler_angle_gamma
  store_accessor :metadata, :quaternion_one
  store_accessor :metadata, :quaternion_two
  store_accessor :metadata, :quaternion_three
  store_accessor :metadata, :quaternion_four
  store_accessor :metadata, :bbox_u_r_x
  store_accessor :metadata, :bbox_u_r_y
  store_accessor :metadata, :bbox_u_r_z
  store_accessor :metadata, :bbox_u_l_x
  store_accessor :metadata, :bbox_u_l_y
  store_accessor :metadata, :bbox_u_l_z
  store_accessor :metadata, :bbox_d_r_x
  store_accessor :metadata, :bbox_d_r_y
  store_accessor :metadata, :bbox_d_r_z
  store_accessor :metadata, :bbox_d_l_x
  store_accessor :metadata, :bbox_d_l_y
  store_accessor :metadata, :bbox_d_l_z
  store_accessor :metadata, :photo_dimentions
  store_accessor :metadata, :date_of_shooting
  store_accessor :metadata, :projection_method
  store_accessor :metadata, :target_material
  store_accessor :metadata, :damage_or_not
  store_accessor :metadata, :representative_photo
  # point cloud metadata
  store_accessor :metadata, :pointcloud_data_id
  store_accessor :metadata, :pointcloud_creation_name
  store_accessor :metadata, :pointcloud_created_at
  store_accessor :metadata, :pointcloud_measurement_method
  store_accessor :metadata, :pointcloud_measurement_environment
  store_accessor :metadata, :pointcloud_measuring_equipment
  store_accessor :metadata, :pointcloud_analysis_method
  store_accessor :metadata, :pointcloud_software
  store_accessor :metadata, :pointcloud_crs
  store_accessor :metadata, :pointcloud_reference_point_x
  store_accessor :metadata, :pointcloud_reference_point_y
  store_accessor :metadata, :pointcloud_reference_point_z

  enum data_type: {
    unselected: 0,
    image: 1,
    movie: 2,
    damage_diagram: 3,
    ortho: 4,
    pointcloud: 5
  }

  enum position_entry_type: {
    center_photo: 0,
    center_camera: 1,
    photo_bbox: 2
  }

  enum projection_method: {
    center_projection: 0,
    orthographic_projection: 1
  }

  enum target_material: {
    main_girder: 'Mg',
    cross_member: 'Cr',
    slab: 'Ds',
    substructure: 'SB',
    bearing_h: 'Bh',
    bearing_m: 'Bm',
    bearing_c: 'Bh',
    top_plate: 'Ct',
    side_wall: 'Sw',
    bottom_plate: 'Cb'
  }

  enum damage_or_not: {
    damage: 1,
    not_damage: 0
  }

  enum representative_photo: {
    representative: 1,
    others: 0
  }

  def main_content?
    return true unless bridge_main_content.nil?

    false
  end

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

  # rubocop:disable Metrics/AbcSize
  def check_image_has_exif
    return unless data_type.to_i == BridgeContent.data_types[:image]

    return unless date_of_shooting.blank?

    return unless data.content_type == 'image/jpeg'

    # read exif
    data.open do |file|
      exif = EXIFR::JPEG.new(file.path)
      break unless exif.exif?

      break if exif.date_time.nil?

      self.date_of_shooting = exif.date_time.strftime('%Y/%m/%d %H:%M:%S')
      save
    end
  end
  # rubocop:enable Metrics/AbcSize
end
# rubocop:enable Metrics/ClassLength
