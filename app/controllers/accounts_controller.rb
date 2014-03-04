class AccountsController < ApplicationController

  def create
	  @account = Account.new(AccountParams.build(params))
  	if @account.save
  		flash[:success] = "account added successfuly!"
  		redirect_to projects_path
  	else
      flash.now[:error] = "error while adding account"
  		render 'new'
  	end
  end

  def new
  	@account = Account.new
  end

  class AccountParams < ActionController::Parameters
	  def self.build params
	    params.require(:account).permit(:username, :name, :lastname)
	  end
  end

end
