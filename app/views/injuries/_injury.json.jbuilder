# frozen_string_literal: true

json.extract! injury, :id, :created_at, :updated_at
json.url injury_url(injury, format: :json)
