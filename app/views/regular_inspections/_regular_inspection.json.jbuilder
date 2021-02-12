# frozen_string_literal: true

json.extract! regular_inspection, :id, :created_at, :updated_at
json.url regular_inspection_url(regular_inspection, format: :json)
