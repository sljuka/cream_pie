class Project < ActiveRecord::Base

	validates_presence_of :name

	has_many :features, dependent: :destroy
	has_many :project_members
	has_many :accounts, :through => :project_members

	#retrieve projects which have at least one feature who's name starts with 'h' or 'H'
	
	def self.h_projects
		project_ids = Project.select("projects.id").joins(:features).where(["features.name like ?", "H%"])
		Project.where(:id => project_ids)
	end

	def self.available_accounts(project)
		Account.all - project.accounts
	end

end
