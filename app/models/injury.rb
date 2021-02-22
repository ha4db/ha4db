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

  # 定量的に取得した値
  attr_json :quantitatively_obtained_value, :string
  # 単位
  attr_json :unit, :string
  # 損傷パターン
  attr_json :injury_pattern, :string
  # 分類
  attr_json :classification, :string
  # 所見
  attr_json :impression, :string
end
