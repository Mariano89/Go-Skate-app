class Photo
	include Mongoid::Document
	mount_uploader :photo, PictureUploader
	field :caption, type: String
	belongs_to :skate_session
end