# frozen_string_literal: true

# Bridges Controller
class BridgesController < ApplicationController
  before_action :set_bridge, only: %i[show update destroy]

  # GET /bridges
  # GET /bridges.json
  def index
    @bridges = Bridge.all
  end

  # GET /bridges/1
  # GET /bridges/1.json
  def show; end

  # POST /bridges
  # POST /bridges.json
  def create
    @bridge = Bridge.new(bridge_params)

    if @bridge.save
      render :show, status: :created, location: @bridge
    else
      render json: @bridge.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bridges/1
  # PATCH/PUT /bridges/1.json
  def update
    if @bridge.update(bridge_params)
      render :show, status: :ok, location: @bridge
    else
      render json: @bridge.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bridges/1
  # DELETE /bridges/1.json
  def destroy
    @bridge.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bridge
    @bridge = Bridge.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def bridge_params
    params.require(:bridge).permit(:name)
  end
end
