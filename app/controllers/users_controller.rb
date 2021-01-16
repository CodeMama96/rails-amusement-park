class UsersController < ApplicationController
      def show
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
      end
    
      def new
        @user = User.new
      end
    
    
      # POST /users
      def create
        @user = User.new(user_params)
        if @user.save
        session[:user_id] = @user.id
            redirect_to user_path(@user)
      else
        render :new
      end
      end
    
    
    
      private
        def user_params
          params.require(:user).permit(:name, :password, :tickets, :nausea, :happiness, :height, :admin)
        end

      

        def redirect_if_not_logged_in
            redirect_to root_path if session[:user_id] == nil
        end
end
