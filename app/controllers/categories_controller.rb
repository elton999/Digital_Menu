class CategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :get_table
    
    def index
        @categories = Category.all
    end 
end
