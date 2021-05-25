class ApplicationController < ActionController::Base
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
end
