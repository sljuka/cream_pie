require 'securerandom'

module FeaturesHelper

	def generate_random_token
		self.token = SecureRandom.hex(64)
	end

end
