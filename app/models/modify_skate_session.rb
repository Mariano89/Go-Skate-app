class ModifySkateSession
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :skate_session
  mount_uploader :photo, PictureUploader
end
