class UsersController < ApplicationController

  before_action :set_user , except: [:create, :index]  

  def index 
    @users = User.all
    render json: @users , status: :ok

  end

  def show 
    render json: @users , status: :ok
  end

  def create 
    @users = User.new(user_params)
    if @users.save 
      render json: @users , status: :created
    else 
      render json: { message: @users.errors.full_messages } , status: :unprocessable_entity
    end
  end

  def update 
    if @users.update(user_params)
      render json: @users , status: :ok
    else 
      render json: {message: @users.errors.full_messages}, status: :unprocessable_entity
    end
  end

	def destroy
		if @users.destroy
	 		render json: {message: 'user deleted succefully'} , status: :ok
		else 
			render json: {message: @users.errors.full_messages} , status: :unprocessable_entity	
		end
	end
 

  private 

  def user_params
    params.permit(:user_name, :user_email, :user_number, :role , :active )
  end

  def set_user
    @users = User.find_by(id: params[:id])
    unless @users.present? 
      render json: {message: 'user not present'} , status: :not_found
      return
    end
  end

end
