class SkateSessionsController < ApplicationController
	def index
		if params[:current]
			@skate_sessions = SkateSession.where(:created_at.gt => DateTime.now.beginning_of_day)

		elsif params[:old]
			@skate_sessions = SkateSession.where(:created_at.lt => DateTime.now.beginning_of_day)
		else
			@skate_sessions = SkateSession.all
		end

	end

 	def show
 		@skate_session = SkateSession.find(params[:id])
 		@photo = @skate_session.photos.new
	end

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

	def edit
		@skate_session = SkateSession.find(params[:id])
	end

	def update
		@skate_session = SkateSession.find(params[:id])

		if @skate_session.update(skate_session_params)
			redirect_to skate_sessions_path
		else
			render :edit
		end
end

	def skate_session_params
		params.require(:skate_session).permit(:spot, :photo)
	end

end
