# frozen_string_literal: true

# Injury model
class Diagnosis < ApplicationRecord
  include AttrJson::Record
  attr_json_config(default_container_attribute: :other_data)

  belongs_to :regular_inspection
  belongs_to :injury, optional: true

  validates :component_category, presence: true
  validates :result, presence: true
  validates :injury, presence: true, if: :need_injury?

  enum result: {
    unselected: 0,
    one: 1,
    two: 2,
    three: 3
  }

  private

  def need_injury?
    if result == 'two' || result == 'three'
      true
    else
      false
    end
  end
end
