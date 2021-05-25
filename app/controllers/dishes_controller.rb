class DishesController < ApplicationController
    before_action :authenticate_user!
    before_action :user_is_admin?
    before_action :get_all_categories, only: [:new, :create]
    
    def index
        @dishes = Dish.all
        if current_user.admin
            render :index
            # do view for clients
        end
    end

    def new
        @dish = Dish.new
    end

    def create
        @dish = Dish.new params_dish
        if @dish.save
            redirect_to dishes_path
        else
            render :new
        end
    end

    private
    def params_dish
        params.require(:dish).permit(:name, :description, :category_id)
    end

    def get_all_categories
        @categories = Category.all
    end
end
