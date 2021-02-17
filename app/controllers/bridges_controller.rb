# frozen_string_literal: true

# BridgesController
class BridgesController < UserBaseController
  before_action :set_bridge, only: %i[show edit update destroy]

  # GET /bridges
  # GET /bridges.json
  def index
    @bridges = Bridge.all
  end

  # GET /bridges/1
  # GET /bridges/1.json
  def show; end

  # GET /bridges/new
  def new
    @bridge = Bridge.new
    @bridge.location = 'POINT(140.084556 36.104611)'
  end

  # GET /bridges/1/edit
  def edit; end

  # POST /bridges
  # POST /bridges.json
  def create
    @bridge = Bridge.new(bridge_params)

    respond_to do |format|
      if @bridge.save
        format.html do
          redirect_to @bridge,
                      notice: I18n.t('controller.common.success_on_create', model_name: Bridge.model_name.human)
        end
        format.json { render :show, status: :created, location: @bridge }
      else
        format.html { render :new }
        format.json { render json: @bridge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bridges/1
  # PATCH/PUT /bridges/1.json
  def update
    respond_to do |format|
      if @bridge.update(bridge_params)
        format.html do
          redirect_to @bridge,
                      notice: I18n.t('controller.common.success_on_update', model_name: Bridge.model_name.human)
        end
        format.json { render :show, status: :ok, location: @bridge }
      else
        format.html { render :edit }
        format.json { render json: @bridge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bridges/1
  # DELETE /bridges/1.json
  def destroy
    @bridge.destroy
    respond_to do |format|
      format.html do
        redirect_to bridges_url,
                    notice: I18n.t('controller.common.success_on_destroy', model_name: Bridge.model_name.human)
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bridge
    @bridge = Bridge.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def bridge_params
    params.fetch(:bridge, {}).permit(:title, :address, :location, :road_name)
  end
end
