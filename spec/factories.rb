FactoryGirl.define do
  
	factory :feature do
		sequence(:name) {|n| "Feature#{n}" }
	end

  factory :project do
  	sequence(:name) {|n| "Project#{n}" }
  end

end