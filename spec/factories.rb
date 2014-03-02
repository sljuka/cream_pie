FactoryGirl.define do
  
	factory :feature do
		sequence(:name) {|n| "Feature#{n}" }
		sequence(:token) {|n| "##{n}"}
	end

  factory :project do
  	sequence(:name) {|n| "Project#{n}" }
  end

end