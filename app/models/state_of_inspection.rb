# frozen_string_literal: true

# StateOfInspection model
class StateOfInspection < ApplicationRecord
  include AttrJson::Record
  attr_json_config(default_container_attribute: :other_data)

  belongs_to :regular_inspection
  belongs_to :bridge_content
  validates :component_category, presence: true
end
