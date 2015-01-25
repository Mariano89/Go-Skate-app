class SkateSession
  include Mongoid::Document
  include Mongoid::Timestamps
  field :spot, type: String
  has_many :photos
  has_many :videos
  validates :spot, presence: true
  # def date_published
  # 	created_at.localtime.strftime("%A, %B, %-d, %Y at %l:%M %p")
  # end

end
