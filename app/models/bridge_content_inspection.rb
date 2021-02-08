# frozen_string_literal: true

# BridgeContentInspection Model
class BridgeContentInspection < ApplicationRecord
  belongs_to :bridge_content
  belongs_to :inspection
  validates :bridge_content, presence: true
  validates :inspection, presence: true, uniqueness: { scope: :bridge_content }
  store_accessor :data, :seek
  store_accessor :data, :position
  store_accessor :data, :pointposition
  validates :seek, numericality: { only_integer: false }, allow_blank: true

  def create_inspection(bridge_content_inspection_params, inspection_params)
    new_inspection = Inspection.new(inspection_params.merge({ bridge: bridge_content.bridge }))
    begin
      ActiveRecord::Base.transaction do
        new_inspection.save!
        self.attributes = bridge_content_inspection_params.merge({ inspection: new_inspection })
        save!
      end
    rescue ActiveRecord::RecordInvalid
      # do nothing
    end
    new_inspection
  end
end
