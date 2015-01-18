class CreateSession < ActiveRecord::Base
  include Mongoid::Document
  field :spot, type: String
  # field :upload_photo, type: String
  field :upload_clip, type: String

  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/	
end
