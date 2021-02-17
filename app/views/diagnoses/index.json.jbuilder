# frozen_string_literal: true

json.array! @diagnoses, partial: 'diagnoses/diagnosis', as: :diagnosis
