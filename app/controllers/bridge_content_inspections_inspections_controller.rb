# frozen_string_literal: true

# BridgeContentsInspectionsInspectionsController
class BridgeContentInspectionsInspectionsController < UserBaseController
  before_action :set_bridge
  before_action :set_bridge_content
  before_action :set_inspection

  # GET /bridges/1/bridge_contents/1/inspections/1/new
  def new
    @bridge_content_inspection = BridgeContentInspection.new(bridge_content: @bridge_content)
  end

  # POST /bridges/1/bridge_contents/1/inspections/1/create
  # POST /bridges/1/bridge_contents/1/inspections/1/create.json
  def create
    @bridge_content_inspection = BridgeContentInspection.new(bridge_content_inspection_params)
    @bridge_content_inspection.bridge_content = @bridge_content
    @bridge_content_inspection.inspection = @inspection
    respond_to do |format|
      if @bridge_content_inspection.save
        format.html do
          redirect_to bridge_bridge_content_bridge_content_inspection_url(@bridge,
                                                                          @bridge_content,
                                                                          @bridge_content_inspection),
                      notice: I18n.t('controller.common.success_on_create',
                                     model_name: BridgeContentInspection.model_name.human)
        end
        format.json { render :show, status: :created, location: @bridge_content_inspection }
      else
        format.html { render :new }
        format.json { render json: @bridge_content_inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_bridge_content
    @bridge_content = BridgeContent.where(bridge: @bridge).find(params[:bridge_content_id])
  end

  def set_bridge
    @bridge = Bridge.find(params[:bridge_id])
  end

  def set_inspection
    @inspection = Inspection.where(bridge: @bridge).find(params[:inspection_id])
  end

  # Only allow a list of trusted parameters through.
  def bridge_content_inspection_params
    params.fetch(:bridge_content_inspection, {}).permit(:seek, :position, :pointposition)
  end
end
