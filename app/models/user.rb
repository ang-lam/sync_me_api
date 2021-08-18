class User < ApplicationRecord
    has_many :mentors, foreign_key: :mentor_id, class_name: "Connection"
    has_many :mentees, through: :mentors
    has_many :mentees, foreign_key: :mentee_id, class_name: "Connection"
    has_many :mentors, through: :mentees

    has_secure_password
    validates :email, uniqueness: {case_sensitive: false}
    validates :password, presence: true, length: {minimum: 5}, allow_nil: true
end
