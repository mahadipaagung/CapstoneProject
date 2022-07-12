class InformasiEdukasisController < ApplicationController
  before_action :set_informasi_edukasi, only: %i[ show create update destroy ]

  def index
    @informasi = InformasiEdukasi.all

    render json: {
      data: @informasi
    }
  end

  def show
    render json: {
      data: @informasi
    }
  end

  def create
    @informasi = InformasiEdukasi.new(informasi_params)
    @informasi.save

    if @informasi.save
      render json: {
        status: "true",
        code: 200,
        message: "Informasi berhasil tersimpan",
        data: @informasi
      }
    else
      render json: {
        status: "false",
        code: 404,
        message: "Terjadi kesalahan, gagal menyimpan informasi"
      }
    end
  end

  def update
    @informasi.update(informasi_params)

    if @informasi.update(informasi_params)
      render json: {
        status: "true",
        code: 200,
        message: "Edit informasi berhasil"
      }
    else
      render json: {
        status: "false",
        code: 404,
        message: "Terjadi kesalahan, edit informasi gagal"
      }
    end
  end

  def destroy
    @informasi.destroy

    if @informasi.destroy
      render json: {
        status: "true",
        code: 200,
        message: "Delete informasi berhasil"
      }
    else
      render json: {
        status: "false",
        code: 404,
        message: "Terjadi kesalahan, delete data gagal"
      }
    end
  end

  private
  def set_informasi_edukasi
    @informasi = InformasiEdukasi.find_by(id: params[:id])
  end

  def informasi_params
    params.require(:informasi_edukasi).permit(:judul, :content)
  end
end
