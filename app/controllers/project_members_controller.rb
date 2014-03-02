class ProjectMembersController < ApplicationController
  def create
  	@project = Project.find(params[:project_id])
  	if(ProjectMember.add_member_to_project(:account_id => params[:account_id], :project_id => @project.id))
  		flash[:success] = "member added successfuly!"
  	else
  		flash.now[:error] = "error while adding project"
  	end
  	redirect_to @project
  end

  def destroy
		@project = Project.find(params[:id])
    @project_member = ProjectMember.find(:first, :conditions => { :project_id => @project.id, :account_id => params[:account_id] })
    @project_member.destroy
    
    redirect_to @project
  end
end
