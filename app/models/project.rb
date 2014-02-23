class Project < ActiveRecord::Base

	validates_presence_of :name

	has_many :features, dependent: :destroy

end
