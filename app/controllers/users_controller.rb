class UsersController < ApplicationController

	def index
		@users = SkateSession.all
		@user = SkateSession.new
	end


	def new
		@user = User.new
	end

	def create
		@user = User.new(params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation))
		if @user.valid?
			if @user.save # sign up was success
				flash[:info] = "Sign up was a success"
				redirect_to login_path #change path to a new page for user
			end
		else
				flash.now[:danger] = @user.errors.full_messages.to_sentence
				render :new
		end
	end
	def show
		@user = User.find(params[:id])

	end
end