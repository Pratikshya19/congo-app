class SessionsController < ApplicationController

    skip_before_action :authenticated, only: [:new, :create]

    def new

    end

    def create
        @user = User.find_by(email: params[:email])
        byebug
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to '/users/:id'
        else
            redirect_to login_path
        end
    end

    def destroy
        session.delete(:user_id)
        # session[:user_id] = nil
    end
end
