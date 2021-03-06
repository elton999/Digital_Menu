class OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :get_table
    before_action :get_order
    before_action :check_dish

    def index
        
    end

    def update
        if @order.update order_params
            redirect_to orders_path(table_id: @table.id)
        else
            render :index
        end
    end

    private
    def check_dish
        if params[:dish_id]
            redirect_to new_order_order_item_path( order_id: @order.id, table_id: @table.id, dish_id: params[:dish_id])
        end
    end

    def order_params
        params.require(:order).permit(:close_order)
    end
end
