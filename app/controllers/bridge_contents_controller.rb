# frozen_string_literal: true

# BridgeContentsController
class BridgeContentsController < UserBaseController
  before_action :set_bridge
  before_action :set_bridge_content, only: %i[show edit update destroy]

  # GET /bridges/1/bridge_contents
  # GET /brigges/1/bridge_contents.json
  def index
    @bridge_contents = BridgeContent.where(bridge: @bridge).all
  end

  # GET /bridges/1/bridge_contents/1
  # GET /bridges/1/bridge_contents/1.json
  def show; end

  # GET /bridges/1/bridge_contents/new
  def new
    @bridge_content = BridgeContent.new(bridge: @bridge)
  end

  # GET /bridges/1/bridge_contents/1/edit
  def edit; end

  # POST /bridges/1/bridge_contents
  # POST /bridges/1/bridge_contents.json
  def create
    @bridge_content = BridgeContent.new(bridge_content_params)
    @bridge_content.bridge = @bridge

    respond_to do |format|
      if @bridge_content.save
        format.html do
          redirect_to [@bridge, @bridge_content],
                      notice: I18n.t('controller.common.success_on_create', model_name: BridgeContent.model_name.human)
        end
        format.json { render :show, status: :created, location: @bridge_content }
      else
        format.html { render :new }
        format.json { render json: @bridge_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bridges/1/bridge_contents/1
  # PATCH/PUT /bridges/1/bridge_contents/1.json
  def update
    respond_to do |format|
      if @bridge_content.update(bridge_content_params)
        format.html do
          redirect_to [@bridge, @bridge_content],
                      notice: I18n.t('controller.common.success_on_update', model_name: BridgeContent.model_name.human)
        end
        format.json { render :show, status: :ok, location: @bridge_content }
      else
        format.html { render :edit }
        format.json { render json: @bridge_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bridges/1/bridge_contents/1
  # DELETE /bridges/1/bridge_contents/1.json
  def destroy
    @bridge_content.destroy
    respond_to do |format|
      format.html do
        redirect_to bridge_bridge_contents_url(@bridge),
                    notice: I18n.t('controller.common.success_on_destroy', model_name: BridgeContent.model_name.human)
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bridge_content
    @bridge_content = BridgeContent.where(bridge: @bridge).find(params[:id])
  end

  def set_bridge
    @bridge = Bridge.find(params[:bridge_id])
  end

  # Only allow a list of trusted parameters through.
  def bridge_content_params
    params.fetch(:bridge_content, {}).permit(:title, :data, :data_type)
  end
end
