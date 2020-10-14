# frozen_string_literal: true

json.array! @bridge_content_inspections,
            partial: 'bridge_content_inspections/bridge_content_inspection',
            as: :bridge_content_inspection
