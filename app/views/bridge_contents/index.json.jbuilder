# frozen_string_literal: true

json.array! @bridge_contents, partial: 'bridge_contents/bridge_content', as: :bridge_content
