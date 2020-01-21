class ProjectCrewMembersController < ApplicationController
    def new
        @project = Project.find(params[:id])
        @project_crew_member = ProjectCrewMember.new
    end

    def create
        @project = Project.find(params[:project_crew_member][:project_id])
        @project_crew_member = ProjectCrewMember.new(project_crew_member_params)
        if @project_crew_member.valid?
            @project_crew_member.save
            redirect_to project_path(@project)
        else
            render :new
        end
    end

    private
    def project_crew_member_params
        params.require(:project_crew_member).permit(:director_id, :crew_member_id, :project_id, :job)
    end
end
