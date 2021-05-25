class CategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :get_table
    
    def index
        @categories = Category.all
    end

    private
    def get_table
        @table = Table.find_by(id: params[:table_id])
        unless @table
            redirect_to tables_path
        end
    end
end
