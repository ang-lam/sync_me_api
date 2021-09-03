class User < ApplicationRecord
    has_many :followed_users, foreign_key: :follower_id , class_name: "Connection"
    has_many :followed, through: :followed_users

    has_many :following_user, foreign_key: :followed_id, class_name: "Connection"
    has_many :followers, through: :following_user

    has_many :posts

    has_many :sent_messages, foreign_key: :sender_id, class_name: "Message"
    has_many :senders, through: :sent_messages
    has_many :received_messages, foreign_key: :recipient_id, class_name: "Message"
    has_many :recipients, through: :received_messages


    has_secure_password
    validates :email, uniqueness: {case_sensitive: false}
    validates :username, uniqueness: true
    validates :password, presence: true, length: {minimum: 5}, allow_nil: true

    def messages
        sent = self.sent_messages
        received = self.received_messages
        sent + received
    end
end
