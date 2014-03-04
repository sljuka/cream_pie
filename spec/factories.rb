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

  factory :pera, class: Account do
    username "pera"
    name "pera"
    lastname "peric"
  end

  factory :perin_projekat, class: Project do
    name "perin projekat"
    description "ovo je perin projekat"
  end

  factory :pera_project_member, class: ProjectMember do
    association :account, factory: :pera
    association :project, factory: :perin_projekat
  end

end