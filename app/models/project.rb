class Project < ActiveRecord::Base

	validates_presence_of :name

	has_many :features, dependent: :destroy

	def self.h_projects
		Project.select("projects.*").joins(:features).where(["features.name like ? COLLATE Latin1_General_CS_AS", "H%"])
	end

end
