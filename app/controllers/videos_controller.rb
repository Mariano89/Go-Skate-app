class VideosController < ApplicationController

	def index
		@video = Video.all
	end

	def new
		@video = Video.new
	end

	def show
		@video = Video.find(params[:id])
	end

	def create
		@skate_session = SkateSession.find(params[:skate_session_id])
		@video = @skate_session.videos.new(video_params)

		if @video.save
			flash[:info] = "Video was uploaded successfully" 
			redirect_to @skate_session
		else
			render :new
		end
	end

  # def set_success(format, opts)
  #   self.success = true
  # end

		private

	def video_params
		params.require(:video).permit(:video, :caption)
	end

end



