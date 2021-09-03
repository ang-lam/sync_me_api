class Message < ApplicationRecord
    belongs_to :sender, class_name: "User"
    belongs_to :recipient, class_name: "User"

    def created_at
        attributes['created_at'].strftime("%m/%d/%Y %H:%M")
    end
end
