# frozen_string_literal: true

json.extract! diagnosis, :id, :created_at, :updated_at
json.url diagnosis_url(diagnosis, format: :json)
