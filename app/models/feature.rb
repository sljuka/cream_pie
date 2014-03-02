class Feature < ActiveRecord::Base

	validates_presence_of :name
	validates_presence_of :token
	validates_uniqueness_of :token

	belongs_to :project

  before_validation do
    generate_random_token
  end

	def generate_random_token
		self.token = SecureRandom.hex(32)
	end

end
