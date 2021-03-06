# frozen_string_literal: true

json.extract! bridge_content,
              :id,
              :data_type,
              :ortho_tile_info,
              :ortho_metadata,
              :pointcloud_info,
              :pointcloud_metadata,
              :position_entry_type,
              :center_x,
              :center_y,
              :center_z,
              :euler_angle_alpha,
              :euler_angle_beta,
              :euler_angle_gamma,
              :quaternion_one,
              :quaternion_two,
              :quaternion_three,
              :quaternion_four,
              :bbox_u_r_x,
              :bbox_u_r_y,
              :bbox_u_r_z,
              :bbox_u_l_x,
              :bbox_u_l_y,
              :bbox_u_l_z,
              :bbox_d_r_x,
              :bbox_d_r_y,
              :bbox_d_r_z,
              :bbox_d_l_x,
              :bbox_d_l_y,
              :bbox_d_l_z,
              :photo_dimentions,
              :date_of_shooting,
              :projection_method,
              :target_material,
              :damage_or_not,
              :representative_photo,
              :pointcloud_data_id,
              :pointcloud_creation_name,
              :pointcloud_created_at,
              :pointcloud_measurement_method,
              :pointcloud_measurement_environment,
              :pointcloud_measuring_equipment,
              :pointcloud_analysis_method,
              :pointcloud_software,
              :pointcloud_crs,
              :pointcloud_reference_point_x,
              :pointcloud_reference_point_y,
              :pointcloud_reference_point_z,
              :created_at,
              :updated_at
json.url regular_inspection_bridge_content_url(@regular_inspection, bridge_content, format: :json)
json.src url_for(bridge_content.data)
if bridge_content.data_type.to_i == 1 || bridge_content.data_type.to_i == 2
  json.content_type bridge_content.data.content_type
else
  json.content_type ''
end
if bridge_content.bridge_content_injury.present?
  json.ortho_geojson bridge_content.bridge_content_injury.ortho_geojson
  json.pointposition bridge_content.bridge_content_injury.pointposition
  json.injury_type bridge_content.bridge_content_injury.injury.injury_type
else
  json.ortho_geojson ''
  json.pointposition ''
  json.injury_type ''
end
