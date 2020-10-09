# frozen_string_literal: true

# InspectionsController
class InspectionsController < UserBaseController
  before_action :set_bridge
  before_action :set_inspection, only: %i[show edit update destroy]

  # GET /bridges/1/inspections
  # GET /bridges/1/inspections.json
  def index
    @inspections = Inspection.where(bridge: @bridge).all
  end

  # GET /bridges/1/inspections/1
  # GET /bridges/1/inspections/1.json
  def show; end

  # GET /bridges/1/inspections/new
  def new
    @inspection = Inspection.new(bridge: @bridge)
  end

  # GET /bridges/1/inspections/1/edit
  def edit; end

  # POST /bridges/1/inspections
  # POST /bridges/1/inspections.json
  def create
    @inspection = Inspection.new(inspection_params)
    @inspection.bridge = @bridge

    respond_to do |format|
      if @inspection.save
        format.html { redirect_to [@bridge, @inspection], notice: 'Inspection was successfully created.' }
        format.json { render :show, status: :created, location: @inspection }
      else
        format.html { render :new }
        format.json { render json: @inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bridges/1/inspections/1
  # PATCH/PUT /bridges/1/inspections/1.json
  def update
    respond_to do |format|
      if @inspection.update(inspection_params)
        format.html { redirect_to [@bridge, @inspection], notice: 'Inspection was successfully updated.' }
        format.json { render :show, status: :ok, location: @inspection }
      else
        format.html { render :edit }
        format.json { render json: @inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bridges/1/inspections/1
  # DELETE /bridges/1/inspections/1.json
  def destroy
    @inspection.destroy
    respond_to do |format|
      format.html { redirect_to bridge_inspections_url(@bridge), notice: 'Inspection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_inspection
    @inspection = Inspection.where(bridge: @bridge).find(params[:id])
  end

  def set_bridge
    @bridge = Bridge.find(params[:bridge_id])
  end

  # Only allow a list of trusted parameters through.
  def inspection_params
    params.fetch(:inspection, {}).permit(:title, :category, :geom, :date, :description)
  end
end
