class OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :get_table
    before_action :get_order
    before_action :check_dish

    def index
        
    end

    private
    def check_dish
        if params[:dish_id]
            redirect_to new_order_order_item_path( order_id: @order.id, table_id: @table.id, dish_id: params[:dish_id])
        end
    end
end
