# frozen_string_literal: true

json.array! @injuries, partial: 'injuries/injury', as: :injury
