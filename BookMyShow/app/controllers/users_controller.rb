class UsersController < ApplicationController
  
  before_action :set_user , only: [:update , :destroy]  
  

  def index 
    @users = User.all
    
    @users = User.where(id: params[:user_id])  if params[:user_id].present? 

     
    @users = User.where(user_email: params[:user_email]) if params[:user_email].present?
    
    @users = User.where(user_number: params[:user_number])  if params[:user_number].present?
     
    if @users.blank? 
      render json: {messsage: 'user not found'}, status: :not_found
      return
    end
    render 'index' , status: :ok

  end   

  def show 
    # if params[:user_id].present? 
    #   @user = User.where(id: params[:user_id])
    # end
    # if params[:user_email].present? 
    #   @user = User.where(user_email: params[:user_email])
    # end
    # if params[:user_number].present? 
    #   @user = User.where(user_number: params[:user_number])
    # end
    # render json: @user #, status: :ok
  end

  def create 
    @user = User.new(user_params)
    if @user.save 
      render json: {message: " user created successfully!"} , status: :created
    else 
      render json: { message: @user.errors.full_messages } , status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(user_email: params[:user_email])
    if @user && @user.authenticate(params[:password])
      token = JsonWebToken.encode_token({user_id: @user.id})
      render json: { message: "Logged in successfully",
                    token: token,
                    user_id: @user.id }, status: :ok
    else
      render json: { error: "Invalid credentials" }, status: :unauthorized
    end
  end

  def update 
    if @user.update(user_params)
      render json: @user  , status: :ok
    else 
      render json: {message: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

	def destroy
		if @user.destroy
	 		render json: {message: 'user deleted succefully'} , status: :ok
		else 
			render json: {message: @user.errors.full_messages} , status: :unprocessable_entity	
		end
	end
 

  private 

  def user_params
    params.permit(:user_name, :user_email, :user_number, :role, :active, :password, :password_confirmation)
  end

  def set_user
    @user = User.find_by(id: params[:id])
    unless @user.present? 
      render json: {message: 'user not present'} , status: :not_found
      return
    end
  end

end
