# frozen_string_literal: true

json.extract! soundness, :id, :created_at, :updated_at
json.url soundness_url(soundness, format: :json)
