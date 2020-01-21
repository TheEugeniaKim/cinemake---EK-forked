class Language < ApplicationRecord
    has_many :movies

    def self.names
        self.all.map{|language| language.name}
    end

    def self.abbreviations
        self.all.map{|language| language.abbreviation}
    end
end
