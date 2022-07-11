class WastesController < ApplicationController
    before_action :set_waste, only: %i[ show edit update destroy ]

  def index
    @wastes = Waste.all

    render json: {
        wastes: @wastes
    }
  end

  def show
    @waste = Waste.find(params[:id])

    render json: {
        waste: @waste,
        category: @waste.category
    }
  end

  def create
    @waste = Waste.new(waste_params)
    @waste.save

    if @waste.save
        render json: {
            status: "true",
            code: 200,
            message: "Berhasil mengirim data sampah",
            data: @waste
        }
    else
        render json: {
            status: "false",
            code: 404,
            message: "Terjadi kesalahan, Gagal mengirim data sampah"
        }
    end
  end

  def update
    @waste.update(waste_params)

    if @waste.update(waste_params)
        render json: {
            status: "true",
            code: 200,
            message: "Berhasil mengubah data sampah",
            data: @waste
        }
    else
        render json: {
            status: "false",
            code: 404,
            message: "Terjadi kesalahan, gagal mengubah data sampah"
        }
    end
  end

  def destroy
    @waste.destroy

    if @waste.destroy
        render json: {
            status: "true",
            code: 200,
            message: "Berhasil menghapus data sampah"
        }
    else
        render json: {
            status: "false",
            code: 404,
            message: "Terjadi kesalahan, gagal menghapus data sampah"
        }
    end
  end

  private
  def set_waste
    @waste = Waste.find(params[:id])
  end

  def waste_params
    params.require(:waste).permit(:nama, :deskripsi, :harga, :category_id)
  end
end
