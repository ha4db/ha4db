# frozen_string_literal: true

CSV.generate({ row_sep: "\r\n", force_quotes: true }) do |csv|
  cols = {
    BridgeContent.human_attribute_name(:pointcloud_data_id) => ->(u) { u.pointcloud_data_id },
    BridgeContent.human_attribute_name(:pointcloud_creation_name) => ->(u) { u.pointcloud_creation_name },
    BridgeContent.human_attribute_name(:pointcloud_created_at) => ->(u) { u.pointcloud_created_at },
    BridgeContent.human_attribute_name(:pointcloud_measurement_method) => ->(u) { u.pointcloud_measurement_method },
    BridgeContent.human_attribute_name(:pointcloud_measurement_environment) => ->(u) { u.pointcloud_measurement_environment },
    BridgeContent.human_attribute_name(:pointcloud_measuring_equipment) => ->(u) { u.pointcloud_measuring_equipment },
    BridgeContent.human_attribute_name(:pointcloud_analysis_method) => ->(u) { u.pointcloud_analysis_method },
    BridgeContent.human_attribute_name(:pointcloud_software) => ->(u) { u.pointcloud_software },
    BridgeContent.human_attribute_name(:pointcloud_crs) => ->(u) { u.pointcloud_crs },
    BridgeContent.human_attribute_name(:pointcloud_reference_point_x) => ->(u) { u.pointcloud_reference_point_x },
    BridgeContent.human_attribute_name(:pointcloud_reference_point_y) => ->(u) { u.pointcloud_reference_point_y },
    BridgeContent.human_attribute_name(:pointcloud_reference_point_z) => ->(u) { u.pointcloud_reference_point_z }
  }
  csv << cols.keys
  @bridge.bridge_contents.each do |bridge_content|
    next unless bridge_content.data_type.to_i == BridgeContent.data_types['pointcloud']

    csv << cols.map.each do |_k, col|
      col.call(bridge_content).to_s
    end
  end
end
