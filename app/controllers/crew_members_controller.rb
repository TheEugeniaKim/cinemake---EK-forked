require 'rest-client'
require 'pry'

class CrewMembersController < ApplicationController
   
    def index 
        
    end

    def show
        if CrewMember.ids.include?(params[:id].to_i)
            @crew_member = CrewMember.find(params[:id])
        else 
            hash = CrewMember.get_crew_info(params[:id])
            @crew_member = CrewMember.new(:id => hash["id"], :birthday => hash["birthday"], :gender_id => hash["gender"], :place_of_birth => hash["place_of_birth"], :bio => hash["biography"], :name => hash["name"], :crew_member_type => hash["known_for_department"], :image => hash["profile_path"])
        end
    end

    def create
        if CrewMember.ids.include?(params["crew_member"]["id"].to_i)
            @crew_member = CrewMember.find(params["crew_member"]["id"])
            redirect_to new_role_path(@crew_member)
        else 
            @crew_member = CrewMember.create(:id => params["crew_member"]["id"], :birthday => params["crew_member"]["birthday"], :gender_id => params["crew_member"]["gender_id"], :place_of_birth => params["crew_member"]["place_of_birth"], :bio => params["crew_member"]["bio"], :name => params["crew_member"]["name"], :crew_member_type => params["crew_member"]["crew_member_type"], :image => params["crew_member"]["image"])
            redirect_to new_role_path(@crew_member)
        end
    end

    def movie_index
        @movie = Movie.find(params[:id])
    end

end