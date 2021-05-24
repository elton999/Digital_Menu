class CategoriesController < ApplicationController
    
    def index
        @categories = Category.all    
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new params_category
        if @category.save
            redirect_to  categories_path
        else
            render :new
        end
    end

    private
    def params_category
        params.require(:category).permit(:name)
    end
end
