class Account < ActiveRecord::Base

	has_many :account_details
	has_many :project_members
	has_many :projects, :through => :project_members

	validates_presence_of :username

	after_create do
		self.account_details.create(:street => "#{self.name} i #{self.lastname}")
	end

end
