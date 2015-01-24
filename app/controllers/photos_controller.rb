class PhotosController < ApplicationController

	def new
	@photo = Photo.all
	end

 	def show
 		@photo = Photo.find(params[:id])
	end

	def create
		@skate_session = SkateSession.find(params[:skate_session_id])
		@photo = @skate_session.photos.new(photo_params)

		if @photo.save

			redirect_to @skate_session
		else
			render :new
		end
	end

	def photo_params
		params.require(:photo).permit(:photo, :caption)
	end
end