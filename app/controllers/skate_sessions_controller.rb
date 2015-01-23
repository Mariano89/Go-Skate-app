class SkateSessionsController < ApplicationController
	def index
		if params[:current] = true
			@skate_sessions = SkateSession.where(date_created: Time.now)
		elsif params[:current] = false

		end
			@skate_sessions = SkateSession.all.order(created_at: :desc)
			@skate_session = SkateSession.new
	end

# 	def show
# 		@skate_session = SkateSession.find(params[:id])

	def new
		@skate_session = SkateSession.new
	end

	def create
		@skate_session = SkateSession.new(skate_session_params)

		if @skate_session.save
			flash[:info] = "Session has been created"
			redirect_to "/skate_sessions?current=true"
			# redirect_to user_path(current_user)
		else
			flash.now[:danger] = @skate_session.errors.full_messages.to_sentence
			render :new
		end
	end

# 	def edit
# 		@skate_session = SkateSession.find(params[:id])
# 	end

# 	def update
# 		@skate_session = SkateSession.find(params[:id])

# 		if @skate_session.update(skate_session_params)
# 			redirect_to skate_sessions_path
# 		else
# 			render :edit
# 		end
# 	end
# end
	def skate_session_params
		params.require(:skate_session).permit(:spot, :photo)
	end

	def modify_skate_session_params
		params.require(:modify_skate_session).permit(:spot, :photo)
	end

end
