class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show update destroy ]

  def index
    @orders = Order.all
    @respond = []

    @orders.each do |order|
      @respond << {
        order: order,
        details: order.order_details
      }
    end

    render json: {
      orders: @respond
    }
  end

  def show
    @order_detail = @order.order_details
        render json: {
            order: @order_detail,
            waste: @order.wastes
        }
  end

  def create
    @order = Order.new(order_params)
        @order.add_waste(waste_order_params[:wastes])
        @order.add_subtotal
        @order.add_total_price
        @order.save

        if @order.save
            render json: {
              status: "true",
              code: 200,
              message: "Berhasil menambah data",
              data: @order
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
    @order.update(order_params)
        
        if @order.update(order_params)
            render json: {
              status: "true",
              code: 200,
              message: "Berhasil mengubah data",
              data: @order
            }
        else
            render json: {
              status: "false",
              code: 404,
              message: "Terjadi kesalahan, Gagal mengubah data"
            }
        end
  end

  def destroy
    @order.order_details.destroy_all
        @order.destroy

        if @order.destroy
            render json: {
              status: "true",
              code: 200,
              message: "Berhasil menghapus data",
            }
          else
            render json: {
              status: "false",
              code: 404,
              message: "Terjadi kesalahan, gagal menghapus data"
            }
        end
  end

  private
    def order_params
        params.require(:order).permit(:penyalur_id, :pengumpul_id, :deskripsi)
    end

    def waste_order_params
        params.require(:order).permit(wastes: [:id, :quantity])
    end

    def set_order
        @order = Order.find_by(id: params[:id])
    end
end
