module ApplicationHelper

	def current_user
		if(Account.count == 0)
			Account.create(:username => "Djura", :name => "Djura", :lastname => "Djuric")
		end
		Account.first
	end

end
