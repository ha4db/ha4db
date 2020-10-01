# frozen_string_literal: true

# Mlti Importers Controller
class MlitImportersController < UserBaseController
  def new; end

  def preview
    update_file = preview_params[:upload_file]
    @bridge = MlitImporter.import(update_file)
    unless @bridge.valid?
      render :new
    end
  end

  def create
    @bridge = Bridge.new(bridge_params)

    respond_to do |format|
      if @bridge.save
        format.html { redirect_to @bridge, notice: 'Bridge was successfully created.' }
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
    params.fetch(:bridge, {}).permit(:title, :address, :location)
  end
end
