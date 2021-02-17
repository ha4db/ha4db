# frozen_string_literal: true

# Component model
class Component < ApplicationRecord
  belongs_to :bridge
  validates :bridge, presence: true
  validates :span_number, presence: true
  validates :component_category, presence: true

  def show_name
    I18n.t('activerecord.attributes.component.span_number') +
      " #{span_number} " +
      I18n.t("enums.component.category.#{Component.categories.invert[component_category]}") +
      title
  end

  enum category: {
    unselected: 0,
    superstructure_main_girder: 1,
    superstructure_horizontal_grider: 2,
    superstructure_slab: 3,
    substructure: 4,
    support_structure: 5,
    other: 6
  }
end
