class PengumpulsController < ApplicationController
  before_action :set_pengumpul, only: %i[ show update destroy ]

  # GET /pengumpuls
  def index
    @pengumpuls = Pengumpul.all

    render json: @pengumpuls
  end

  # GET /pengumpuls/1
  def show
    render json: @pengumpul
  end

  # POST /pengumpuls
  def create
    @pengumpul = Pengumpul.new(pengumpul_params)

    if @pengumpul.save
      render json: @pengumpul, status: :created, logged_in: true, location: @pengumpul
    else
      render json: @pengumpul.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pengumpuls/1
  def update
    if @pengumpul.update(pengumpul_params)
      render json: @pengumpul
    else
      render json: @pengumpul.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pengumpuls/1
  def destroy
    @pengumpul.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pengumpul
      @pengumpul = Pengumpul.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pengumpul_params
      params.require(:pengumpul).permit(:nama, :email, :password_digest)
    end
end
