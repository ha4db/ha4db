# frozen_string_literal: true

json.array! @inspections, partial: 'inspections/inspection', as: :inspection
