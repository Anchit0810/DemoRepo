class UsersController < ApplicationController

	before_action :set_user , except: [:create,:index]

	# skip_before_action :set_user, only: [:index,:create]

 	def index
		@users = User.all
 		render json: @users
 	end

 	def show
		# @user
		# user = User.find(params[:id])
		render json: @user
	end 
	
	def create 
		@user = User.new(users_params)
		if @user.save
			render json: @user
		else 
			render json: { message: @user.errors.full_messages  }
		end
	end
	
	def update 
		# @user 
 	 	# user = User.find(params[:id])
	 	if @user.update(users_params)
		 	render json: @user
		else
			render json: {message: @user.errors.full_messages}
		end	
	end

	def destroy
		# @user
		# user = User.find(params[:id])
		if @user.destroy
	 		render json: {message: 'user delete succefully'}
		else 
			render json: {message: @user.errors.full_messages}	
		end
	end


	private 
	def users_params
		params.permit(:first_name,:last_name,:email,:country_code,:mobile_number,:country,:state,:city,:user_code)
	end

	def set_user
		@user = User.find_by(id: params[:id])
		unless @user.present?
			render json: {message: 'user not found'}
		end
	end



end

