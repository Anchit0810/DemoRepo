class UsersController < ApplicationController

 	def index
		users = User.all
 		render json: users
 	end

 	def show
		user = User.find(params[:id])
		render json: user
	end 
	
	def create 
		user = User.create(users_params)
		if user.save
			render json: user
		else 
			render json: {erros: user.error.full_messages}
		end
	end
	
	def update 
	user = User.find(params[:id])
	user.update(users_params)
	render json: user 	
	end

	def destroy
	user = User.find(params[:id])
	user.destroy
	render json: {mesasge: "user delete succefully"}	
	end


	private 
	def users_params
		params.permit(:first_name,:last_name,:email,:country_code,:mobile_number,:country,:state,:city)
	end

end
