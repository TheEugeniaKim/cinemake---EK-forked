class ProjectCrewMember < ApplicationRecord
    
    belongs_to :project

    validate :unique_director_for_project
    validate :unique_crew_member_for_project
    
    def unique_director_for_project
        if director_id.present? && ProjectCrewMember.all.select{|pcm| pcm.project_id == project_id}.any?{|pcm|pcm.director_id == director_id}
            errors.add(:director_id, "is already associated with this project")
        end
    end

    def unique_crew_member_for_project
        if crew_member_id.present? && ProjectCrewMember.all.select{|pcm| pcm.project_id == project_id}.any?{|pcm|pcm.crew_member_id == crew_member_id}
            errors.add(:crew_member_id, "is already associated with this project")
        end
    end

    def director
        if self.director_id
            Director.find(self.director_id)
        end
    end

    def crew_member
        if self.crew_member_id
            CrewMember.find(self.crew_member_id)
        end
    end
end
