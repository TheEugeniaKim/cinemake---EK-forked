class Post < ApplicationRecord
    belongs_to :director
    belongs_to :movie, optional: true

    
    def short_body
        if self.body.length > 250
            self.body[0..250] + "..."
        else
            self.body
        end
    end
end
