class ApplicationController < ActionController::Base
    before_action :has_users?
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
        @order = Order.get_from_user_and_table current_user.id, @table.id
    end

    def get_dish
        @dish = Dish.find_by(id: params[:dish_id])
        unless @dish
            redirect_to table_path
        end
    end

    def has_users?
        if User.no_users && request.path == "/"
            redirect_to new_user_registration_path
        end
    end


    def after_sign_in_path_for(resource)
        if current_user.admin
            admin_dishes_path
        else
            tables_path
        end
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
