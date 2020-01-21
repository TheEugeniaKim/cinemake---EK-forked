class Project < ApplicationRecord
    
    belongs_to :movie
    has_many :project_crew_members

    validates :name, :description, :start_date, :end_date, presence: true
    validate :unique_task_id_for_movie, on: :create
    validate :end_must_be_after_start

    def end_must_be_after_start
        if start_date.present? && end_date.present? && end_date < start_date
            errors.add(:end_date, "must be after start date")
        end
    end

    def unique_task_id_for_movie
        if name.present? && Project.all.select{|project| project.movie_id == movie_id}.any?{|project| project.name == name}
            errors.add(:name, "already exists as a project for this movie. Task names must be unique for each movie")
        end
    end

    def pcm_directors
        self.project_crew_members.select{|pcm| pcm.director_id }
    end

    def pcm_crew_members
        self.project_crew_members.select{|pcm| pcm.crew_member_id }
    end

end
