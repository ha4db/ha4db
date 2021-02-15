# frozen_string_literal: true

# Injury model
class Injury < ApplicationRecord
  include AttrJson::Record
  attr_json_config(default_container_attribute: :other_data)

  belongs_to :regular_inspection
  belongs_to :component

  enum grade: {
    unselected: 0,
    a: 1,
    b: 2,
    c: 3,
    d: 4
  }
end
