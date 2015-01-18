class CreateSessionsController < ApplicationController

	def new
		@create_session = Create_session.new
	end

	def create
		@create_session = Create_session.create(params.require(:create_session).permit(:spot))

	end

	def show
		# @create_session = Create_session.find(params[:id])
	end

end