# frozen_string_literal: true

options = { row_sep: "\r\n", force_quotes: true }
# rubocop:disable Metrics/BlockLength
CSV.generate(**options) do |csv|
  header1 = ['座標情報(test)', '標高基準(test']
  csv << header1
  cols = {
    BridgeContent.human_attribute_name(:position_entry_type) => ->(u) { u.position_entry_type },
    BridgeContent.human_attribute_name(:center_x) => ->(u) { u.center_x },
    BridgeContent.human_attribute_name(:center_y) => ->(u) { u.center_y },
    BridgeContent.human_attribute_name(:center_z) => ->(u) { u.center_z },
    BridgeContent.human_attribute_name(:euler_angle_alpha) => ->(u) { u.euler_angle_alpha },
    BridgeContent.human_attribute_name(:euler_angle_beta) => ->(u) { u.euler_angle_beta },
    BridgeContent.human_attribute_name(:euler_angle_gamma) => ->(u) { u.euler_angle_gamma },
    BridgeContent.human_attribute_name(:photo_dimentions) => ->(u) { u.photo_dimentions },
    '相対パス' => ->(_) { '..\R_PHOTO\001' },
    '点検写真ファイル名' => ->(u) { u.data.filename.to_s },
    BridgeContent.human_attribute_name(:date_of_shooting) => ->(u) { u.date_of_shooting },
    BridgeContent.human_attribute_name(:projection_method) => ->(u) { u.projection_method },
    BridgeContent.human_attribute_name(:target_material) => ->(u) { u.target_material },
    BridgeContent.human_attribute_name(:damage_or_not) => ->(u) { u.damage_or_not },
    BridgeContent.human_attribute_name(:representative_photo) => ->(u) { u.representative_photo }
  }
  csv << cols.keys
  @regular_inspection.bridge_contents.each do |bridge_content|
    next unless bridge_content.data_type.to_i == BridgeContent.data_types['image']

    csv << cols.map.each do |_k, col|
      col.call(bridge_content).to_s
    end
  end
end
# rubocop:enable Metrics/BlockLength
