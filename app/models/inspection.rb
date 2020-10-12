# frozen_string_literal: true

# Inspection Model
class Inspection < ApplicationRecord
  belongs_to :bridge
  has_many :bridge_content_inspections
  has_many :bridge_contents, through: :bridge_content_inspections
  validates :title, presence: true
  validates :date, presence: true
  enum category: {
    unselected: 0,
    superstructure_main_girder: 1,
    superstructure_horizontal_grider: 2,
    superstructure_slab: 3,
    substructure: 4,
    support_structure: 5,
    other: 6
  }
  store_accessor :report_data, :description
end
