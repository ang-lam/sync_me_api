class User < ApplicationRecord
    has_many :followed_users, foreign_key: :follower_id , class_name: "Connection"
    has_many :followed, through: :followed_users

    has_many :following_user, foreign_key: :followed_id, class_name: "Connection"
    has_many :followers, through: :following_user

    has_many :posts
 
    has_many :received_messages, foreign_key: :recipient_id, class_name: "Message"
    has_many :received_messages, through: :received_messages
    has_many :sent_messages, foreign_key: :sender_id, class_name: "Message"
    has_many :sent_messages, through: :sent_messages
    #need to work on associations


    has_secure_password
    validates :email, uniqueness: {case_sensitive: false}
    validates :password, presence: true, length: {minimum: 5}, allow_nil: true
end
