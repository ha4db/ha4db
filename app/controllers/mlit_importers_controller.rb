# frozen_string_literal: true

# Mlti Importers Controller
class MlitImportersController < UserBaseController
  def new; end

  def preview
    update_file = preview_params[:upload_file]
    @bridge = MlitImporter.import(update_file)
  end

  def create; end

  private

  def preview_params
    params.permit(:upload_file)
  end
end
