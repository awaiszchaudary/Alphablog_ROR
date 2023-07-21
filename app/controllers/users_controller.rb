class UsersController < ApplicationController

    skip_before_action :authenticate_user!, only: [:index]
    #before_action :require_same_user, except: [:index]


    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path
    end

    private

        def require_same_user
            if current_user != @user
                flash[:alert] = "You can edit or delete your profile"
                redirect_to users_path
            end
        end


end