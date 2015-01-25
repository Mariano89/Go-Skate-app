class PhotosController < ApplicationController

	def new
		@photo = Photo.new
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

	def edit
 		@photo = Photo.find(params[:id])
 	end

 	def update
 		if @photo.update(photo_params)
			redirect_to edit_skate_session_photo_path
		else
			render :edit
		end
	end

	def photo_params
		params.require(:photo).permit(:photo, :caption)
	end
end