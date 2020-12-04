# frozen_string_literal: true

# SoundnessesController
class SoundnessesController < UserBaseController
  before_action :set_bridge
  before_action :set_soundness, only: %i[show edit update destroy]

  # GET /bridges/1/soundnesses
  # GET /bridges/1/soundnesses.json
  def index
    @soundnesses = Soundness.where(bridge: @bridge).all
  end

  # GET /bridges/1/soundnesses/1
  # GET /bridges/1/soundnesses/1.json
  def show; end

  # GET /bridges/1/soundnesses/new
  def new
    @soundness = Soundness.new(bridge: @bridge)
  end

  # GET /bridges/1/soundnesses/1/edit
  def edit; end

  # POST /bridges/1/soundnesses
  # POST /bridges/1/soundnesses.json
  def create
    @soundness = Soundness.new(soundness_params)
    @soundness.bridge = @bridge

    respond_to do |format|
      if @soundness.save
        format.html do
          redirect_to [@bridge, @soundness],
                      notice: I18n.t('controller.common.success_on_create', model_name: Soundness.model_name.human)
        end
        format.json { render :show, status: :created, location: @soundness }
      else
        format.html { render :new }
        format.json { render json: @soundness.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /soundnesses/1
  # PATCH/PUT /soundnesses/1.json
  def update
    respond_to do |format|
      if @soundness.update(soundness_params)
        format.html do
          redirect_to [@bridge, @soundness],
                      notice: I18n.t('controller.common.success_on_update', model_name: Soundness.model_name.human)
        end
        format.json { render :show, status: :ok, location: @soundness }
      else
        format.html { render :edit }
        format.json { render json: @soundness.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /soundnesses/1
  # DELETE /soundnesses/1.json
  def destroy
    @soundness.destroy
    respond_to do |format|
      format.html do
        redirect_to bridge_soundnesses_url(@bridge),
                    notice: I18n.t('controller.common.success_on_destroy', model_name: Soundness.model_name.human)
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_soundness
    @soundness = Soundness.find(params[:id])
  end

  def set_bridge
    @bridge = Bridge.find(params[:bridge_id])
  end

  # Only allow a list of trusted parameters through.
  def soundness_params
    params.fetch(:soundness, {}).permit(:evaluation_at, :evaluation, :overall_evaluation)
  end
end
