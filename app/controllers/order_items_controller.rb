class OrderItemsController < ApplicationController
    before_action :get_table
    before_action :get_order
    before_action :get_dish, only: [:new, :create, :edit, :update]
    before_action :has_dish_in_order?, only: [:new, :create]

    def new
        @order_item = OrderItem.new
    end

    def create
        params_order_item[:order_id] = @order.id

        @order_item = OrderItem.new params_order_item
        
        if @order_item.save
            redirect_to categories_path table_id: @table.id
        else
            render :new
        end
    end

    def edit
        @order_item = @order.order_items.find_by(dish_id: @dish.id)

        if @order_item
            render :edit
        else
            redirect_to edit_order_order_item_path(order_id: @order_item.id, table_id: @table.id, dish_id: @dish.id)
        end
    end

    def update
        @order_item = @order.order_items.find_by(dish_id: @dish.id)
        
        if @order_item.update params_update_order_item
            redirect_to categories_path table_id: @table.id
        else
            render :edit
        end
    end

    private
    def params_order_item
        params.require(:order_item).permit(:dish_id , :order_id, :quantity)
    end

    def params_update_order_item
        params.require(:order_item).permit(:quantity)
    end

    def has_dish_in_order?
        @order_item = @order.order_items.find_by(dish_id: @dish.id)
        redirect_to edit_order_order_item_path(id: @order.id, order_id: @order_item.id, table_id: @table.id, dish_id: @dish.id) unless !@order_item
    end

end
