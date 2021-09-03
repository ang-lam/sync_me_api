class Post < ApplicationRecord
    belongs_to :user
    
    def created_at
        attributes['created_at'].strftime("%m/%d/%Y %H:%M")
    end
end
