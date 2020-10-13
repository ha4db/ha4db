# frozen_string_literal: true

json.extract! bridge_content_inspection, :id, :created_at, :updated_at
json.url bridge_content_inspection_url(bridge_content_inspection, format: :json)
