class TablesController < ApplicationController
    before_action :authenticate_user!
    before_action :user_is_admin?, except: [:index]

    def index
        @tables = Table.all
    end

    def new
        @table = Table.new 
        @last_table_number = 1
        tables = Table.all
        if(tables.count > 0)
            @last_table_number = tables.last.number + 1
        end
    end

    def create
        @table = Table.new table_params
        if @table.save
            redirect_to tables_path
        else
            flash[:alert] = "Can't save the table"
            render :index
        end
    end

    def destroy
        @table = Table.find(params[:id])
        if(table && @table.destroy)
            flash[:alert] = "the was deleted"
        end
        redirect_to tables_path
    end

    private
    def table_params
        params.require(:table).permit(:number)
    end
end
