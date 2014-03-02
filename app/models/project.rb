class Project < ActiveRecord::Base

	validates_presence_of :name

	has_many :features, dependent: :destroy
	has_many :project_members
	has_many :accounts, :through => :project_members

	#retrieve projects which have at least one feature who's name starts with 'h' or 'H'
	
	def self.h_projects
		Project.select("projects.*").joins(:features).where(["features.name like ?", "H%"])
	end

	def self.available_accounts(project)
		Account.all - project.accounts
	end

end
