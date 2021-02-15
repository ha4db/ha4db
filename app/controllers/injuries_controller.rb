# frozen_string_literal: true

# InjuriesController
class InjuriesController < UserBaseController
  before_action :set_regular_inspection
  before_action :set_injury, only: %i[show edit update destroy]

  # GET /regular_inspections/1/injuries
  # GET /regular_inspections/1/injuries.json
  def index
    @injuries = Injury.where(regular_inspection: @regular_inspection).all
  end

  # GET /regular_inspections/1/injuries/1
  # GET /regular_inspections/1/injuries/1.json
  def show; end

  # GET /regular_inspections/1/injuries/new
  def new
    @injury = Injury.new(regular_inspection: @regular_inspection)
    @components = Component.where(bridge: @regular_inspection.bridge)
  end

  # GET /regular_inspections/1/injuries/1/edit
  def edit
    @components = Component.where(bridge: @regular_inspection.bridge)
  end

  # POST /regular_inspections/1/injuries
  # POST /regular_inspections/1/injuries.json
  def create
    @injury = Injury.new(injury_params)
    @injury.regular_inspection = @regular_inspection

    respond_to do |format|
      if @injury.save
        format.html do
          redirect_to [@regular_inspection, @injury],
                      notice: I18n.t('controller.common.success_on_create', model_name: Injury.model_name.human)
        end
        format.json { render :show, status: :created, location: @injury }
      else
        @components = Component.where(bridge: @regular_inspection.bridge)
        format.html { render :new }
        format.json { render json: @injury.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regular_inspections/1/injuries/1
  # PATCH/PUT /regular_inspections/1/injuries/1.json
  def update
    respond_to do |format|
      if @injury.update(injury_params)
        format.html do
          redirect_to [@regular_inspection, @injury],
                      notice: I18n.t('controller.common.success_on_update', model_name: Injury.model_name.human)
        end
        format.json { render :show, status: :ok, location: @injury }
      else
        @components = Component.where(bridge: @regular_inspection.bridge)
        format.html { render :edit }
        format.json { render json: @injury.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regular_inspections/1/injuries/1
  # DELETE /regular_inspections/1/injuries/1.json
  def destroy
    @injury.destroy
    respond_to do |format|
      format.html do
        redirect_to regular_inspections_injuries_url(@regular_inspection),
                    notice: I18n.t('controller.common.success_on_destroy', model_name: Injury.model_name.human)
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_injury
    @injury = Injury.where(regular_inspection: @regular_inspection).find(params[:id])
  end

  def set_regular_inspection
    @regular_inspection = RegularInspection.joins(:bridge).find(params[:regular_inspection_id])
  end

  # Only allow a list of trusted parameters through.
  def injury_params
    params.fetch(:injury, {}).permit(:component_id, :injury_type, :injury_grade)
  end
end
