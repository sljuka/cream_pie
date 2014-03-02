class ProjectMember < ActiveRecord::Base

	belongs_to :account
	belongs_to :project

	def self.add_member_to_project(hash)
		account_id = hash[:account_id]
		project_id = hash[:project_id]
		if(ProjectMember.where(account_id: account_id, project_id: project_id).count > 0)
			false
		else
			ProjectMember.create(account_id: account_id, project_id: project_id)
		end
	end

end
