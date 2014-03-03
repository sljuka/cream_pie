module ApplicationHelper

	def current_user
		Account.first
	end

end
