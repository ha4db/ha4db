# frozen_string_literal: true

# Bridge class
class Bridge < ApplicationRecord
  include AttrJson::Record
  include AttrJson::Record::QueryScopes
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
  attr_json :priority, :integer, default: 0
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
  # フリガナ
  attr_json :kana_title, :string
  # 橋梁ID
  attr_json :bridge_identification_number, :string
  # 橋種
  attr_json :kind_of_bridge, :integer, default: 0

  enum priority_type: {
    priority_unselected: 0,
    priority_a: 1,
    priority_b: 2,
    priority_c: 3
  }

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

  enum kind_of_bridge_type: {
    others: 0,
    concrete: 1,
    steel: 2,
    mixing: 3
  }

  def full_title
    return title if kana_title.blank?

    "#{title} (#{kana_title})"
  end
end
