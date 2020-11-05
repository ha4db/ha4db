# frozen_string_literal: true

# Soundness Model
class Soundness < ApplicationRecord
  belongs_to :bridge

  validates :evaluation, presence: true
  validates :evaluation_at, presence: true

  enum overall_evaluation: {
    unselected: 0,
    one: 1,
    two: 2,
    three: 3,
    four: 4
  }
end
