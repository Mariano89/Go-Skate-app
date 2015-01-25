class Video
	include Mongoid::Document
	mount_uploader :video, VideoUploader
	field :caption, type: String
	belongs_to :skate_session
end