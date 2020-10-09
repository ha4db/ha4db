# frozen_string_literal: true

json.extract! inspection, :id, :created_at, :updated_at
json.url inspection_url(inspection, format: :json)
