class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :firstName, :lastName, :bio, :company, :email, :role
  has_many :mentors
  has_many :mentees
end 
