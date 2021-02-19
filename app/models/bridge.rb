# frozen_string_literal: true

# Bridge class
class Bridge < ApplicationRecord
  include AttrJson::Record
  attr_json_config(default_container_attribute: :other_data)

  has_many :soundnesses
  has_many :regular_inspections
  has_many :components

  validates :title, presence: true
  validates :address, presence: true
  validates :location, presence: true

  attr_json :road_name, :string
  attr_json :bridge_length, :integer
  attr_json :width, :float
  # 適用示方書
  attr_json :applicable_specifications_upper, :string
  attr_json :applicable_specifications_lower, :string
  # 交通量
  attr_json :traffic_count, :string
  # 大型車混入率
  attr_json :large_vehicle_mixing_rate, :string
  # 供用年
  attr_json :year_in_service, :integer
  # 重要度
  attr_json :priority, :string
  # 管理者名
  attr_json :administrator_name, :string
  # 橋梁形式
  attr_json :bridge_type, :string
  # 路下条件
  attr_json :street_condition, :string
  # 代替路の有無
  attr_json :availabillity_of_alternative_route, :integer
  # 自専道or一般道
  attr_json :freeway_or_public_road, :integer
  # 緊急輸送道路
  attr_json :emergency_transport_road, :boolean

  enum availabillity_of_alternative_route_type: {
    unknown: 0,
    available: 1,
    unavailable: 2
  }

  enum freeway_or_public_road_type: {
    unselected: 0,
    freeway: 1,
    public_road: 2
  }
end
