# frozen_string_literal: true

json.extract! bridge, :id, :created_at, :updated_at
json.url bridge_url(bridge, format: :json)
