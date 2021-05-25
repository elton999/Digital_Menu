class OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :get_table
    before_action :get_order
    before_action :get_dish, only: [:new, :create]

    def index
        
    end

    def new
        @order_item = OrderItem.new
    end

    def create
        @order_item = OrderItem.new
    end

    private
    def params_order
        params.require(:order_item).permit(:dish_id, :order_id, :quantity)
    end

    def get_order
        @order = Order.find_by(table_id: params[:table_id])
        unless @order
            @order = Order.create [user_id: current_user.id, table_id: @table.id]
        end
    end

    def get_dish
        @dish = Dish.find_by(id: params[:dish_id])
        unless @order
            redirect_to table_path
        end
    end
end
