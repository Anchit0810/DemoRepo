class UsersController < ApplicationController
 
  def idex
    @users = User.all
    render jason: @users , status: :ok
  end

  def show
    render json: @users , status: :ok
  end

  def create
    @users = User.new(users_params)
    if @user.save
      render json: @users , status: :ok
    else 
      render json: {message: @users.error.full_messages}, status: :unprocessable_entity
  end

  def update
    if @users.update(cities_params)
      render json: @users , status: :ok
    else
      render json: {message: @users.error.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    if @users.destroy
      render json: {message: "user deleted"} , status: :ok
    else 
      render json: {message: @user.error.full_messages} , status: :unprocessable_entity
    end
  end

  private
  def users_params
    params.permit(:user_name , :user_email ,:role , :user_number , :active)
  end

  def set_user
    @users = User.find_by(:id params[:id])
    unless @users.present?
      render json: {message: 'User not present'} , status: :not_found
    end




end
