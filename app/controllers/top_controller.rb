# frozen_string_literal: true

# TopController path=/
class TopController < UserBaseController
  def index
    @matrix = Dashboard.matrix
    @overall_evaluations = Dashboard.sorted_overall_evaluations
    @bridges = Bridge.all
  end
end
