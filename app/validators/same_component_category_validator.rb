# frozen_string_literal: true

# SameComponentCategoryValidator
class SameComponentCategoryValidator < ActiveModel::Validator
  def validate(record)
    return if record.injury.nil?

    return if record.injury.component.component_category == record.component_category

    record.errors.add :injury_id, :injury_component_category_is_not_same
  end
end
