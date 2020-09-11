# frozen_string_literal: true

json.extract! bridge, :id, :name, :address, :created_at, :updated_at
json.location do
  json.longitude bridge.location.longitude
  json.latitude bridge.location.latitude
end
json.url bridge_url(bridge, format: :json)
