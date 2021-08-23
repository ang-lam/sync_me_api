class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :firstName, :lastName, :bio, :company, :email
  has_many :followers
  has_many :followed
end 
