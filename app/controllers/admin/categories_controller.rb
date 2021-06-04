class Admin::CategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :user_is_admin?
    
    def index
        @categories = Category.all
        if current_user.admin
            render :index
        end
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new params_category
        if @category.save
            redirect_to  admin_categories_path
        else
            render :new
        end
    end

    private
    def params_category
        params.require(:category).permit(:name)
    end
end
