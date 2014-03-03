class ProjectMembersController < ApplicationController
  def create
  	@project = Project.find(params[:project_id])
  	if(ProjectMember.add_member_to_project(:account_id => params[:account_id], :project_id => @project.id))
  		flash[:success] = "member added successfuly!"
  	else
  		flash[:error] = "error while adding project member"
  	end
  	redirect_to @project
  end

  def destroy
		@project = Project.find(params[:id])
    @project_member = ProjectMember.find(:first, :conditions => { :project_id => @project.id, :account_id => params[:account_id] })
    if(@project_member.remove_from_project(current_user))
      flash[:success] = "member removed successfuly!"
    else
      flash[:notice] = "member can only be removed by other members"
    end
    
    redirect_to @project
  end
end
