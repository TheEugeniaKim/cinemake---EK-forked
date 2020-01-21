class RolesController < ApplicationController
    def new
        @role = Role.new
        @crew_member = CrewMember.find(params[:id])
    end

    def create
        @role = Role.create!(roles_params)
        redirect_to movie_path(@role.movie_id)
    end

    private 

    def roles_params
        params.require(:role).permit(:crew_member_id, :movie_id, :wage, :hire_date, :name, :featured)
    end 
end