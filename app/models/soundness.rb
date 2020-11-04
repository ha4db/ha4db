# frozen_string_literal: true

# Soundness Model
class Soundness < ApplicationRecord
  belongs_to :bridge

  validates :evaluation, presence: true
  validates :evaluation_at, presence: true
end
