# frozen_string_literal: true

# RegularInspection class
class RegularInspection < ApplicationRecord
  include AttrJson::Record
  attr_json_config(default_container_attribute: :other_data)

  belongs_to :bridge
  validates :bridge, presence: true
  validates :title, presence: true

  # 点検担当者
  attr_json :person_responsible, :string
  # 定期点検実施年月日
  attr_json :periodic_inspection_date, :date
  # 調書更新年月日
  attr_json :record_updated_date, :date
  # 開始日
  attr_json :start_date, :date
  # 終了日
  attr_json :end_date, :date
end
