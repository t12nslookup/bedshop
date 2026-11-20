# frozen_string_literal: true

class MattressesController < ApplicationController
  before_action :set_mattress, only: %i[show edit update destroy]
  before_action :set_shops, only: %i[new create edit update]

  # GET /mattresses or /mattresses.json
  def index
    @mattresses = Mattress.includes(:shop).order(:id)
  end

  # GET /mattresses/1 or /mattresses/1.json
  def show; end

  # GET /mattresses/new
  def new
    @mattress = Mattress.new
  end

  # GET /mattresses/1/edit
  def edit; end

  # POST /mattresses or /mattresses.json
  def create
    @mattress = Mattress.new(mattress_params)

    if @mattress.save
      redirect_to mattresses_path, notice: t('mattresses.created')
    else
      render :new, status: :unprocessable_content
    end
  end

  # PATCH/PUT /mattresses/1 or /mattresses/1.json
  def update
    respond_to do |format|
      if @mattress.update(mattress_params)
        format.html { redirect_to mattresses_path, notice: t('mattresses.updated') }
        format.json { render :show, status: :ok, location: @mattress }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @mattress.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /mattresses/1 or /mattresses/1.json
  def destroy
    @mattress.destroy

    respond_to do |format|
      format.html { redirect_to mattresses_path, notice: t('mattresses.destroyed') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_shops
    @shops = Shop.order(:shop)
  end

  def set_mattress
    @mattress = Mattress.includes(:shop).find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def mattress_params
    params.expect(mattress: [:shop_id])
  end
end
