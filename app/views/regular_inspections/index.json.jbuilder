# frozen_string_literal: true

json.array! @regular_inspections, partial: 'regular_inspections/regular_inspection', as: :regular_inspection
