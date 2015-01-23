class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:user][:email])

		if user && user.authenticate(params[:user][:password])
			session[:user_id] = user.id
			flash[:success] = "You logged in successfully!"
			redirect_to user_path(user.id)
		else
			flash.now[:danger] = "Username or password incorrect."
			render :new
		end
		
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/login'
	end


end