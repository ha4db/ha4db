# frozen_string_literal: true

# Mlti Importers Controller
class MlitImportersController < UserBaseController
  def new; end

  def preview
    update_file = preview_params[:upload_file]
    @bridge = MlitImporter.import(update_file)
    render :new unless @bridge.valid?
  end

  def create
    @bridge = Bridge.new(bridge_params)

    respond_to do |format|
      if @bridge.save
        format.html do
          redirect_to @bridge,
                      notice: I18n.t('controller.common.success_on_create', model_name: Bridge.model_name.human)
        end
      else
        format.html { render :new }
      end
    end
  end

  private

  def preview_params
    params.permit(:upload_file)
  end

  # Only allow a list of trusted parameters through.
  def bridge_params
    params.fetch(:bridge, {}).permit(:title, :address, :location, :road_name)
  end
end
