class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :first_name, type: String
  field :last_name, type: String
  field :username, type: String
  field :email, type: String
  field :password_digest, type: String

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, confirmation: true
end
