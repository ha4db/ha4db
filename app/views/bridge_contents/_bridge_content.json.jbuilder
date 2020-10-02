# frozen_string_literal: true

json.extract! bridge_content, :id, :created_at, :updated_at
json.url bridge_content_url(bridge_content, format: :json)
