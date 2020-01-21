class Friend < ApplicationRecord

    def friender
        Director.find(self.friender_id)
    end

    def friendee
        Director.find(self.friendee_id)
    end
end
