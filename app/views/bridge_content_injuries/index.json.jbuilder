# frozen_string_literal: true

json.array! @bridge_content_injuries, partial: 'bridge_content_injuries/bridge_content_injury',
                                      as: :bridge_content_injury
