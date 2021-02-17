# frozen_string_literal: true

# BridgeContentInjuriesController
class BridgeContentInjuriesController < UserBaseController
  before_action :set_regular_inspection
  before_action :set_injury
  before_action :set_bridge_content_injury, only: %i[show edit update destroy]

  # GET /regular_inspections/1/injuries/1/bridge_content_injuries
  # GET /regular_inspections/1/injuries/1/bridge_content_injuries.json
  def index
    @bridge_content_injuries = BridgeContentInjury.where(injury: @injury).all
  end

  # GET /regular_inspections/1/injuries/1/bridge_content_injuries/1
  # GET /regular_inspections/1/injuries/1/bridge_content_injuries/1.json
  def show; end

  # GET /regular_inspections/1/injuries/1/bridge_content_injuries/new
  def new
    @bridge_content_injury = BridgeContentInjury.new(injury: @injury)
  end

  # GET /regular_inspections/1/injuries/1/bridge_content_injuries/1/edit
  def edit; end

  # POST /regular_inspections/1/injuries/1/bridge_content_injuries
  # POST /regular_inspections/1/injuries/1/bridge_content_injuries.json
  def create
    @bridge_content_injury = BridgeContentInjury.new(bridge_content_injury_params)
    @bridge_content_injury.injury = @injury

    respond_to do |format|
      if @bridge_content_injury.save
        format.html do
          redirect_to [@regular_inspection, @injury, @bridge_content_injury],
                      notice: I18n.t('controller.common.success_on_create',
                                     model_name: BridgeContentInjury.model_name.human)
        end
        format.json { render :show, status: :created, location: @bridge_content_injury }
      else
        format.html { render :new }
        format.json { render json: @bridge_content_injury.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regular_inspections/1/injuries/1/bridge_content_injuries/1
  # PATCH/PUT /regular_inspections/1/injuries/1/bridge_content_injuries/1.json
  def update
    respond_to do |format|
      if @bridge_content_injury.update(bridge_content_injury_params)
        format.html do
          redirect_to [@regular_inspection, @injury, @bridge_content_injury],
                      notice: I18n.t('controller.common.success_on_update',
                                     model_name: BridgeContentInjury.model_name.human)
        end
        format.json { render :show, status: :ok, location: @bridge_content_injury }
      else
        format.html { render :edit }
        format.json { render json: @bridge_content_injury.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regular_inspections/1/injuries/1/bridge_content_injuries/1
  # DELETE /regular_inspections/1/injuries/1/bridge_content_injuries/1.json
  def destroy
    @bridge_content_injury.destroy
    respond_to do |format|
      format.html do
        redirect_to regular_inspection_injury_bridge_content_injuries_url(@regular_inspection, @injury),
                    notice: I18n.t('controller.common.success_on_destroy',
                                   model_name: BridgeContentInjury.model_name.human)
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bridge_content_injury
    @bridge_content_injury = BridgeContentInjury.joins(:bridge_content, :injury)
                                                .where(injury: @injury)
                                                .find(params[:id])
  end

  def set_regular_inspection
    @regular_inspection = RegularInspection.joins(:bridge)
                                           .includes(:bridge_contents)
                                           .find(params[:regular_inspection_id])
  end

  def set_injury
    @injury = Injury.includes(:bridge_content_injuries)
                    .find(params[:injury_id])
  end

  # Only allow a list of trusted parameters through.
  def bridge_content_injury_params
    params.fetch(:bridge_content_injury, {}).permit(:bridge_content_id)
  end
end
