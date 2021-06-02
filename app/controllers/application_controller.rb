class ApplicationController < ActionController::Base
    #before_action :has_users?
    before_action :configure_permitted_parameters, if: :devise_controller?

    private
    def user_is_admin?
        unless current_user.admin
            redirect_to new_user_session_path
        end
    end
    
    def get_table
        @table = Table.find_by(id: params[:table_id])
        unless @table
            redirect_to tables_path
        end
    end

    def get_order
        unless params[:order_id]
            @order = Order.find_by(table_id: @table.id, user_id: current_user.id, close_order: false, delivered: false)
        else
            @order = Order.find_by(id: params[:order_id], table_id: @table.id, user_id: current_user.id, close_order: false, delivered: false)
        end
            
        unless @order
            Order.create [user_id: current_user.id, table_id: @table.id, close_order: false, delivered: false]
            @order = Order.find_by(table_id: @table.id, user_id: current_user.id, close_order: false)
        end
    end

    def get_dish
        @dish = Dish.find_by(id: params[:dish_id])
        unless @dish
            redirect_to table_path
        end
    end

    def has_users?
        if User.all.count == 0
            redirect_to new_user_registration_path
        end
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
