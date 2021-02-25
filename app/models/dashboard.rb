# frozen_string_literal: true

# Dashboard class
class Dashboard
  class << self
    def matrix(bridges)
      bridges = bridges.order('soundnesses.evaluation_at')
      make_matrix(bridges)
    end

    def sorted_overall_evaluations
      overall_evaluations = Soundness.overall_evaluations.map { |k, _| k }
      unselected = overall_evaluations.shift
      overall_evaluations << unselected
      overall_evaluations.reverse
    end

    def soundness_chart(bridges)
      bridges = bridges.order('soundnesses.evaluation_at')
      values = {}
      sorted_overall_evaluations.each { |k| values[k.to_s] = 0 }
      bridges.each do |bridge|
        soundness = bridge.soundnesses.last
        if soundness.nil?
          values['unselected'] += 1
        else
          values[soundness.overall_evaluation] += 1
        end
      end
      values
    end

    def priority_chart(bridges)
      priority_types = Bridge.priority_types.map { |k, _| k }
      values = {}
      priority_types.each { |k| values[k.to_s] = 0 }
      bridges.each do |bridge|
        key = Bridge.priority_types.invert[bridge.priority]
        if !key.nil?
          values[key] += 1
        else
          values['priority_unselected']
        end
      end
      values
    end

    private

    def matrix_item(bridge)
      soundness = bridge.soundnesses.last
      return nil, nil, bridge if soundness.nil?

      year = soundness.evaluation_at.strftime('%Y')
      overall_evaluation = soundness.overall_evaluation
      [year, overall_evaluation, bridge]
    end

    def make_matrix(bridges)
      matrix = {}
      bridges.each do |bridge|
        year, overall_evaluation, bridge = matrix_item(bridge)
        next if year.nil?

        matrix[year] = {} if matrix[year].nil?
        matrix[year][overall_evaluation] = [] if matrix[year][overall_evaluation].nil?
        matrix[year][overall_evaluation] << bridge
      end
      matrix
    end
  end
end
