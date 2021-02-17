# frozen_string_literal: true

# Injury model
class Injury < ApplicationRecord
  include AttrJson::Record
  attr_json_config(default_container_attribute: :other_data)

  belongs_to :regular_inspection
  belongs_to :component
  has_many :bridge_content_injuries

  enum grade: {
    unselected: 0,
    a: 1,
    b: 2,
    c: 3,
    d: 4,
    e: 5
  }

  def show_name
    I18n.t("enums.component.category.#{Component.categories.invert[component.component_category]}") +
      " #{injury_type} #{injury_grade}"
  end
end
