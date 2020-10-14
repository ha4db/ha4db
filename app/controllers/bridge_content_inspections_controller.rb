# frozen_string_literal: true

# BridgeContentsInspectionsController
class BridgeContentInspectionsController < UserBaseController
  before_action :set_bridge
  before_action :set_bridge_content
  before_action :set_bridge_content_inspection, only: %i[show edit update destroy]

  # GET /bridges/1/bridge_contents/1/inspections
  # GET /bridges/1/bridge_contents/1/inspections.json
  def index
    @bridge_content_inspections = BridgeContentInspection.where(bridge_content: @bridge_content)
                                                         .includes(:bridge_content, :inspection)
  end

  # GET /bridges/1/bridge_contents/1/bridge_content_inspections/1
  # GET /bridges/1/bridge_contents/1/bridge_content_inspections/1.json
  def show; end

  # GET /bridges/1/bridge_contents/1/bridge_content_inspections/new
  def new
    @bridge_content_inspection = BridgeContentInspection.new(bridge_content: @bridge_content)
    @inspection = @bridge_content_inspection.build_inspection(bridge: @bridge)
  end

  # GET /bridges/1/bridge_contents/1/bridge_content_inspections/1/edit
  def edit; end

  # POST /bridges/1/bridge_contents/1/bridge_content_inspections
  # POST /bridges/1/bridge_contents/1/bridge_content_inspections.json
  def create
    @bridge_content_inspection = BridgeContentInspection.new(bridge_content: @bridge_content)
    @inspection = @bridge_content_inspection.create_inspection(bridge_content_inspection_params, inspection_params)

    respond_to do |format|
      if @inspection.errors.empty? && @bridge_content_inspection.errors.empty?
        format.html do
          redirect_to bridge_bridge_content_bridge_content_inspection_url(@bridge, @bridge_content, @bridge_content_inspection),
                      notice: 'Bridge content inspection was successfully created.'
        end
        format.json { render :show, status: :created, location: @bridge_content_inspection }
      else
        format.html { render :new }
        format.json { render json: @bridge_content_inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bridges/1/bridge_contents/1/bridge_content_inspections/1
  # PATCH/PUT /bridges/1/bridge_contents/1/bridge_content_inspections/1.json
  def update
    respond_to do |format|
      if @bridge_content_inspection.update(bridge_content_inspection_params) &&
         @inspection.update(inspection_params)
        format.html do
          redirect_to bridge_bridge_content_bridge_content_inspection_url(@bridge, @bridge_content, @bridge_content_inspection),
                      notice: 'Bridge content inspection was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @bridge_content_inspection }
      else
        format.html { render :edit }
        format.json { render json: @bridge_content_inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bridges/1/bridge_contents/1/bridge_content_inspections/1
  # DELETE /bridges/1/bridge_contents/1/bridge_content_inspections/1.json
  def destroy
    @bridge_content_inspection.destroy
    respond_to do |format|
      format.html do
        redirect_to bridge_bridge_content_bridge_content_inspections_url(@bridge, @bridge_content),
                    notice: 'Bridge content inspection was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bridge_content_inspection
    @bridge_content_inspection = BridgeContentInspection.where(bridge_content: @bridge_content)
                                                        .find(params[:id])
    @inspection = @bridge_content_inspection.inspection
  end

  def set_bridge_content
    @bridge_content = BridgeContent.where(bridge: @bridge).find(params[:bridge_content_id])
  end

  def set_bridge
    @bridge = Bridge.find(params[:bridge_id])
  end

  # Only allow a list of trusted parameters through.
  def bridge_content_inspection_params
    params.fetch(:bridge_content_inspection, {}).permit(:seek, :position)
  end

  def inspection_params
    params.fetch(:inspection, {}).permit(:title, :category, :geom, :date, :description)
  end
end
