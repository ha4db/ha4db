# frozen_string_literal: true

# Regular Inspections Controller
class RegularInspectionsController < UserBaseController
  before_action :set_regular_inspection, only: %i[show edit update destroy]

  # GET /regular_inspections
  # GET /regular_inspections.json
  def index
    @regular_inspections = RegularInspection.all
  end

  # GET /regular_inspections/1
  # GET /regular_inspections/1.json
  def show; end

  # GET /regular_inspections/new
  def new
    @regular_inspection = RegularInspection.new
  end

  # GET /regular_inspections/1/edit
  def edit; end

  # POST /regular_inspections
  # POST /regular_inspections.json
  def create
    @regular_inspection = RegularInspection.new(regular_inspection_params)

    respond_to do |format|
      if @regular_inspection.save
        format.html { redirect_to @regular_inspection, notice: 'Regular inspection was successfully created.' }
        format.json { render :show, status: :created, location: @regular_inspection }
      else
        format.html { render :new }
        format.json { render json: @regular_inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regular_inspections/1
  # PATCH/PUT /regular_inspections/1.json
  def update
    respond_to do |format|
      if @regular_inspection.update(regular_inspection_params)
        format.html { redirect_to @regular_inspection, notice: 'Regular inspection was successfully updated.' }
        format.json { render :show, status: :ok, location: @regular_inspection }
      else
        format.html { render :edit }
        format.json { render json: @regular_inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regular_inspections/1
  # DELETE /regular_inspections/1.json
  def destroy
    @regular_inspection.destroy
    respond_to do |format|
      format.html { redirect_to regular_inspections_url, notice: 'Regular inspection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_regular_inspection
    @regular_inspection = RegularInspection.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def regular_inspection_params
    params.fetch(:regular_inspection, {})
  end
end
