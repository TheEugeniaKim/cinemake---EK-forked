class Director < ApplicationRecord
    
    has_secure_password
    
    has_many :director_movies
    has_many :movies, through: :director_movies
    has_many :posts
    
    validates :name, presence: true
    validates :age, presence: true
    validate :age_is_over_13
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :username, presence: true, uniqueness: true
    # confirmation: true
    
    def edit 
        
    end

    def age_is_over_13
        if age.present? && age < 13
            errors.add(:age, "cannot be less than 13")
        end
    end

    def self.names
        self.all.map{|director|director.name}
    end
    
    def projects
        self.movies.map{|movie| movie.projects}.flatten
    end
    
    def most_recent_three_projects
        self.projects.sort_by{|project| project.created_at}.last(3).reverse
    end

    def friend_requests
        Friend.all.select{|friend| friend.friender == self || friend.friendee == self}.uniq
    end

    def friends
        self.friend_requests.select{|friend| friend.status == "accepted"}
    end

    def pending_friends
        self.friend_requests.select{|friend| friend.status == "pending"}
    end

    def inbound_pending_requests
        self.pending_friends.select{|friend| friend.friendee == self}
    end

    def director_friends
        self.friends.map{|friend| [friend.friender, friend.friendee]}.flatten.reject{|friend| friend == self}
    end

    def friend_names
        self.director_friends.map{|director|director.name}
    end

    def has_pending_friend_requests?
        self.pending_friends.find{|friend| friend.friendee == self}
    end

    def has_left_friend_request?(director)
        self.pending_friends.find{|friend| friend.friender == self && friend.friendee == director}
    end


end
