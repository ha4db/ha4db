# frozen_string_literal: true

# BridgeContentInjurySameOriginValidator
class BridgeContentInjurySameOriginValidator < ActiveModel::Validator
  def validate(record)
    return unless record.injury && record.bridge_content

    return if record.injury.regular_inspection == record.bridge_content.regular_inspection

    record.errors.add :injury_id, :is_not_same_origin
  end
end
