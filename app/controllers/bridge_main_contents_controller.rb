# frozen_string_literal: true

# BridgeMainContentsController
class BridgeMainContentsController < UserBaseController
  before_action :set_regular_inspection
  before_action :set_bridge_main_content, only: %i[destroy]

  # POST /regular_inspections/1/bridge_main_contents
  # POST /regular_inspections/1/bridge_main_contents.json
  def create
    @bridge_main_content = BridgeMainContent.new(bridge_main_content_params)

    respond_to do |format|
      if @bridge_main_content.save
        format.html do
          redirect_to regular_inspection_bridge_contents_url(@regular_inspection),
                      notice: I18n.t('controller.common.success_on_create',
                                     model_name: BridgeMainContent.model_name.human)
        end
        format.json { render :show, status: :created, location: @bridge_main_content }
      else
        format.html { redirect_to regular_inspection_bridge_contents_url(@regular_inspection) }
        format.json { render json: @bridge_main_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regular_inspections/1/bridge_main_contents/1
  # DELETE /regular_inspections/1/bridge_main_contents/1.json
  def destroy
    @bridge_main_content.destroy
    respond_to do |format|
      format.html do
        redirect_to regular_inspection_bridge_contents_url(@regular_inspection),
                    notice: I18n.t('controller.common.success_on_destroy',
                                   model_name: BridgeMainContent.model_name.human)
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bridge_main_content
    @bridge_main_content = BridgeMainContent.find(params[:id])
  end

  def set_regular_inspection
    @regular_inspection = RegularInspection.joins(:bridge).find(params[:regular_inspection_id])
  end

  # Only allow a list of trusted parameters through.
  def bridge_main_content_params
    params.fetch(:bridge_main_content, {}).permit(:bridge_content_id)
  end
end
