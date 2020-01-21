class Api

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

end
