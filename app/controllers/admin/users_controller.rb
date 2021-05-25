class Admin::UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :user_is_admin?
    
    def index
        @users = User.all
    end
    
    def show
        #@user = User.find_by(id: params[:id])
        #if(@user.present?)
        #    render :view
        #else
        #    redirect_to new_user_session_path
        #end
    end
end
