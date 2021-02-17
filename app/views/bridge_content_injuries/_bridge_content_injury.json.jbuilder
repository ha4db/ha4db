# frozen_string_literal: true

json.extract! bridge_content_injury, :id, :created_at, :updated_at
json.url bridge_content_injury_url(bridge_content_injury, format: :json)
