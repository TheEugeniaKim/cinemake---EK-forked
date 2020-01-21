class FriendsController < ApplicationController
    def create
        friend = Friend.create(friend_params)
        redirect_to director_path(friend.friendee)
    end

    def update
        friend = Friend.find(params[:friend][:id])
        friend.update(friend_params)
        redirect_to director_path(friend.friender)
    end

    private
    def friend_params
        params.require(:friend).permit(:friender_id, :friendee_id, :status)
    end
end
