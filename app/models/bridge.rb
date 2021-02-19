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
end
