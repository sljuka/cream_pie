FactoryGirl.define do
  
  factory :empty_project, class: Project do
    sequence(:name) {|n| "Project#{n}" }
    sequence(:description) {|n| "Project#{n}"}  
  end

  factory :project do
    sequence(:name) {|n| "Project#{n}" }
    sequence(:description) {|n| "Project#{n}"}
  end

	factory :feature do
		sequence(:name) {|n| "Feature#{n}" }
		sequence(:token) {|n| "##{n}"}
    project
	end

  factory :account do
    sequence(:username) {|n| "Username#{n}"}
    sequence(:name) {|n| "Name#{n}"}
    sequence(:lastname) {|n| "Lastname#{n}"}
  end


end