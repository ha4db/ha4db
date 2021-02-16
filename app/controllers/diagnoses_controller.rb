# frozen_string_literal: true

# DiagnosesController
class DiagnosesController < UserBaseController
  before_action :set_regular_inspection
  before_action :set_diagnosis, only: %i[show edit update destroy]

  # GET /regular_inspections/1/diagnoses
  # GET /regular_inspections/1/diagnoses.json
  def index
    @diagnoses = Diagnosis.where(regular_inspection: @regular_inspection).joins(:injury).all
  end

  # GET /regular_inspections/1/diagnoses/1
  # GET /regular_inspections/1/diagnoses/1.json
  def show; end

  # GET /regular_inspections/1/diagnoses/new
  def new
    @diagnosis = Diagnosis.new(regular_inspection: @regular_inspection)
  end

  # GET /regular_inspections/1/diagnoses/1/edit
  def edit; end

  # POST /regular_inspections/1/diagnoses
  # POST /regular_inspections/1/diagnoses.json
  def create
    @diagnosis = Diagnosis.new(diagnosis_params)
    @diagnosis.regular_inspection = @regular_inspection

    respond_to do |format|
      if @diagnosis.save
        format.html do
          redirect_to [@regular_inspection, @diagnosis],
                      notice: I18n.t('controller.common.success_on_create', model_name: Diagnosis.model_name.human)
        end
        format.json { render :show, status: :created, location: @diagnosis }
      else
        format.html { render :new }
        format.json { render json: @diagnosis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regular_inspections/1/diagnoses/1
  # PATCH/PUT /regular_inspections/1/diagnoses/1.json
  def update
    respond_to do |format|
      if @diagnosis.update(diagnosis_params)
        format.html do
          redirect_to [@regular_inspection, @diagnosis],
                      notice: I18n.t('controller.common.success_on_update', model_name: Diagnosis.model_name.human)
        end
        format.json { render :show, status: :ok, location: @diagnosis }
      else
        format.html { render :edit }
        format.json { render json: @diagnosis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regular_inspections/1/diagnoses/1
  # DELETE /regular_inspections/1/diagnoses/1.json
  def destroy
    @diagnosis.destroy
    respond_to do |format|
      format.html do
        redirect_to regular_inspection_diagnoses_url(@regular_inspection),
                    notice: I18n.t('controller.common.success_on_destroy', model_name: Diagnosis.model_name.human)
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_diagnosis
    @diagnosis = Diagnosis.find(params[:id])
  end

  def set_regular_inspection
    @regular_inspection = RegularInspection.joins(:bridge).includes(:injuries).find(params[:regular_inspection_id])
  end

  # Only allow a list of trusted parameters through.
  def diagnosis_params
    params.fetch(:diagnosis, {}).permit(:component_category, :result, :injury_id, :observation)
  end
end
