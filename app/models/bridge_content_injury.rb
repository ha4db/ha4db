# frozen_string_literal: true

# BridgeContentInjury
class BridgeContentInjury < ApplicationRecord
  include AttrJson::Record
  attr_json_config(default_container_attribute: :other_data)

  belongs_to :bridge_content
  belongs_to :injury

  validates_with BridgeContentInjurySameOriginValidator

  # 動画 seek
  attr_json :seek, :integer
  # オルソ geojson
  attr_json :ortho_geojson, :string
  attr_json :pointposition, :string
end
