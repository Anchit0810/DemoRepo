class UsersController < ApplicationController
    def index 
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end


    def create
        @user = User.new(user_params)
        if @user.save 
            render @user
        else 
            render json: {message: @user.errors.full_messages}, status: :unprocessable_entity 
        end
    end

    def edit 
        @user = User.find(params[:id])
    end

    def update 
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to @user
        else 
            render 'edit'
        end 
    end 


    def destroy 
        @user = User.find(params[:id])
        if @user.destory 
            redirect_to @user
            render json: {message: 'user successfully deleted' , status: :ok}
        else 
            render json: {message: @user.errors.full_message} , status: :unprocessable_entity
        end
    end

    private 
    
    def user_params
        params.require(:user).permit(:name , :email, :number)
    end
end
