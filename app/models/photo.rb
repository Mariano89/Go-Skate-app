class Photo
	include Mongoid::Document
	mount_uploader :photo, PictureUploader
	field :remote_image_url
	field :caption, type: String
	belongs_to :skate_session
end