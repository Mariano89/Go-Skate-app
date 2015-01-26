class PhotosController < ApplicationController

	def index
		@photo = Photo.all
	end

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
			flash[:info] = "Photo was uploaded successfully"
			redirect_to @skate_session
		else
			render :new
		end
	end

	def edit
 		@photo = Photo.find(params[:id])
 
 		if @photo.update(photo_params)
			redirect_to edit_skate_session_photo_path
		else
			render :edit
		end
 	end

 # 	def update
 # 		@photo = Photo.find(params[:id])

 # 		if @photo.update(photo_params)
	# 		redirect_to edit_skate_session_photo_path
	# 	else
	# 		render :edit
	# 	end
	# end

		private

	def photo_params
		params.require(:photo).permit(:photo, :caption, :remote_image_url)
	end

	# def photo_id_params
	# 	params.require(:photo_id).permit(:photo, :photo_id, :caption)
	# end
end

