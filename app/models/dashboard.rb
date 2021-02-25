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
          values['priority_unselected'] += 1
        end
      end
      values
    end

    def kind_of_bridge_chart(bridges)
      year_in_services = bridges.map(&:year_in_service).filter { |k| !k.nil? }.sort.uniq
      return {} if year_in_services.empty?

      make_kind_of_bridge_chart(year_in_services)
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

    def make_kind_of_bridge_chart(year_in_services)
      start_year = year_in_services[0]
      end_year = year_in_services[-1]
      values = init_kind_of_bridge_chart(start_year, end_year)
      year_in_services.each do |year_in_service|
        targets = Bridge.jsonb_contains(year_in_service: year_in_service)
        targets.each do |bridge|
          values[year_in_service][Bridge.kind_of_bridge_types.invert[bridge.kind_of_bridge].to_s] += 1
        end
      end
      values
    end

    def init_kind_of_bridge_chart(start_year, end_year)
      values = {}
      Range.new(start_year, end_year).each do |year|
        sub_values = {}
        Bridge.kind_of_bridge_types.each do |k, _|
          sub_values[k.to_s] = 0
        end
        values[year] = sub_values
      end
      values
    end
  end
end
