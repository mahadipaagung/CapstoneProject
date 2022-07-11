class PenyalursController < ApplicationController
  before_action :set_penyalur, only: %i[ show update destroy ]

  # GET /penyalurs
  def index
    @penyalurs = Penyalur.all

    render json: @penyalurs
  end

  # GET /penyalurs/1
  def show
    render json: @penyalur
  end

  # POST /penyalurs
  def create
    @penyalur = Penyalur.new(penyalur_params)

    if @penyalur.save
      render json: @penyalur, status: :created, location: @penyalur
    else
      render json: @penyalur.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /penyalurs/1
  def update
    if @penyalur.update(penyalur_params)
      render json: @penyalur
    else
      render json: @penyalur.errors, status: :unprocessable_entity
    end
  end

  # DELETE /penyalurs/1
  def destroy
    @penyalur.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_penyalur
      @penyalur = Penyalur.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def penyalur_params
      # params.fetch(:penyalur, {})
      params.require(:penyalur).permit(:nama, :email, :password_digest, :password_confirmation)
    end
end
