class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]

  def index
    @categories = Category.all

    render json: {data: @categories}
  end

  def show
    render json: {
      data: @category
    }
  end

  def create
    @category = Category.new(category_params)
    @category.save

    if @category.save
      render json: {
        status: "true",
        code: 200,
        message: "Data berhasil tersimpan",
        data: @category
      }
    else
      render json: {
        status: "false",
        code: 404,
        message: "Gagal menambah data"
      }
    end
  end

  def update
    @category.update(category_params)

    if @category.update(category_params)
    render json: {
      status: "true",
      code: 200,
      message: "Data berhasil terupdate",
      data: @category
    }
    else
      render json: {
        status: "false",
        code: 404,
        message: "Gagal update data"
      }
    end
  end

  def destroy
    @category.destroy

    if @category.destroy
      render json: {
        status: "true",
        code: 200,
        message: "Berhasil menghapus data"
      }
    else
      render json: {
        status: "false",
        code: 404,
        message: "Terjadi kesalahan, Gagal menghapus data"
      }
    end
  end
end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:nama)
  end