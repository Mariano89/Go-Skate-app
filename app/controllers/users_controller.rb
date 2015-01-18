class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation))

		if @user.save # sign up was success
			redirect_to application_path #change path to a new page for user
		else
			render :new
		end
	end
	def show
		@user = User.find(params[:id])

	end
end