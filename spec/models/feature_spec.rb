require 'spec_helper'

describe Feature do

	it "can't save 2 features with the same token" do
		@feature1 = Feature.create(:name => 'f1')
		@feature2 = Feature.create(:name => 'f2')
		expect { @feature2.update_column(:token, @feature1.token) }.to raise_error(ActiveRecord::RecordNotUnique) 
	end
	
end
