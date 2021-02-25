# frozen_string_literal: true

# TopController path=/
class TopController < UserBaseController
  def index
    @bridges = Bridge.includes(:soundnesses)
    @matrix = Dashboard.matrix(@bridges)
    @overall_evaluations = Dashboard.sorted_overall_evaluations
    @soundness_chart = Dashboard.soundness_chart(@bridges)
    @priority_chart = Dashboard.priority_chart(@bridges)
    @kind_of_bridge_chart = Dashboard.kind_of_bridge_chart(@bridges)
  end
end
