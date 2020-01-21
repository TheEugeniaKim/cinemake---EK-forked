class CrewMember < ApplicationRecord
    has_many :roles
    has_many :movies, through: :roles

    def self.get_actors_by_name(name)
        artist_name = name.parameterize(separator: '+')
        response = RestClient.get "https://api.themoviedb.org/3/search/person?api_key=c31c8ad23cb4028ce0c0e382ff7408a9&query=#{artist_name}" 
        result_hash = JSON.parse(response) 
        results_array = result_hash["results"].select{|result| result["known_for_department"] == "Acting"}
    end

    def self.get_writers_by_name(name)
        artist_name = name.parameterize(separator: '+')
        response = RestClient.get "https://api.themoviedb.org/3/search/person?api_key=c31c8ad23cb4028ce0c0e382ff7408a9&query=#{artist_name}" 
        result_hash = JSON.parse(response) 
        results_array = result_hash["results"].select{|result| result["known_for_department"] == "Writing"}
    end

    def self.get_crew_info(id)
        response = RestClient.get "https://api.themoviedb.org/3/person/#{id}?api_key=c31c8ad23cb4028ce0c0e382ff7408a9&language=en-US"
        crew_hash = JSON.parse(response)
    end

    def self.ids
        CrewMember.all.map {|crew| crew.id}
    end

    def movie_role(movie)
        self.roles.find{|role| role.movie_id == movie.id}
    end

    def self.actors
        self.all.select{|cm| cm.crew_member_type == "Acting"}
    end

    def self.actor_names
        self.actors.map{|actor|actor.name}
    end

    def self.writers
        self.all.select{|cm| cm.crew_member_type == "Writing"}
    end

    def self.writer_names
        self.writers.map{|writer|writer.name}
    end

    def short_bio
        if self.bio.length > 100
            self.bio[0..100] + "..."
        else
            self.bio
        end
    end
end
