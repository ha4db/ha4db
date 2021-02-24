# frozen_string_literal: true

# ComponentsController
class ComponentsController < UserBaseController
  before_action :set_bridge
  before_action :set_component, only: %i[show edit update destroy]

  # GET /components
  # GET /components.json
  def index
    @components = Component.where(bridge: @bridge).all
  end

  # GET /components/1
  # GET /components/1.json
  def show; end

  # GET /components/new
  def new
    @component = Component.new(bridge: @bridge)
  end

  # GET /components/1/edit
  def edit; end

  # POST /components
  # POST /components.json
  def create
    @component = Component.new(component_params)
    @component.bridge = @bridge

    respond_to do |format|
      if @component.save
        format.html do
          redirect_to [@bridge, @component],
                      notice: I18n.t('controller.common.success_on_create', model_name: Component.model_name.human)
        end
        format.json { render :show, status: :created, location: @component }
      else
        format.html { render :new }
        format.json { render json: @component.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /components/1
  # PATCH/PUT /components/1.json
  def update
    respond_to do |format|
      if @component.update(component_params)
        format.html do
          redirect_to [@bridge, @component],
                      notice: I18n.t('controller.common.success_on_update', model_name: Component.model_name.human)
        end
        format.json { render :show, status: :ok, location: @component }
      else
        format.html { render :edit }
        format.json { render json: @component.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /components/1
  # DELETE /components/1.json
  def destroy
    @component.destroy
    respond_to do |format|
      format.html do
        redirect_to bridge_components_url(@bridge),
                    notice: I18n.t('controller.common.success_on_destroy', model_name: Component.model_name.human)
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_component
    @component = Component.find(params[:id])
  end

  def set_bridge
    @bridge = Bridge.find(params[:bridge_id])
  end

  # Only allow a list of trusted parameters through.
  def component_params
    params.fetch(:component, {}).permit(:span_number, :component_category, :title)
  end
end
