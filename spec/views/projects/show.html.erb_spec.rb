require 'spec_helper'

describe "projects/show.html.erb" do

	let(:project) { FactoryGirl.build_stubbed(:project, name: "my_project") }
	let(:feature) { FactoryGirl.build_stubbed(:feature, name: "new_feature")}

	let(:feature1) { FactoryGirl.build_stubbed(:feature, :name => 'onea')}
	let(:feature2) { FactoryGirl.build_stubbed(:feature, :name => 'spatula')}
	let(:feature3) { FactoryGirl.build_stubbed(:feature, :name => 'feature')}

	let(:account1) { FactoryGirl.build_stubbed(:account, username: "pera") }
	let(:account2) { FactoryGirl.build_stubbed(:account, username: "djura") }

	let(:member1) { FactoryGirl.build_stubbed(:account, username: "srki") }
	let(:member2) { FactoryGirl.build_stubbed(:account, username: "miki") }

	before :each do
		assign(:project, project)
	end

	describe "project section" do

		it "displays project details" do
			render
			rendered.should have_selector('h1', text: project.name)
			rendered.should have_selector('p', text: project.description)
		end

	end

	describe "features section" do

		before :each do
			project.stub(:features).and_return([feature1, feature2, feature3])
		end

		it "displays project's features" do
		  render
		  rendered.should have_content("onea")
		  rendered.should have_content("spatula")
		  rendered.should have_content("feature")
		end

		it "displays additional options for features" do
			render
			displays_feature_options project, feature1
			displays_feature_options project, feature2
			displays_feature_options project, feature3
		end

		it "displats form for adding new features" do
			render
			rendered.should have_xpath("//form[@action='/projects/#{project.id}/features'][@method='post']")
			rendered.should have_css("input[type='text'][name='feature[name]']")
			rendered.should have_xpath("//textarea[@name='feature[description]']")
		end

		describe "printing extra '2' character next to features name" do

			before :each do
				project.stub(:features).and_return [feature1, feature2, feature3]
			end

			it "displays '2' next to every feature that contains 2 'a' in it's name" do		
				render
				rendered.should have_selector('strong', text: '2')
			end

			it "does not display '2' if there are no features with 2 'a' in name" do
				feature2.name = 'feature'
				render
				rendered.should_not have_selector('strong', text: "2")
			end

		end

	end

	describe "available accounts section" do
		before :each do
			assign(:accounts, [account1, account2])
		end

		it "displays add account link" do
			render
			rendered.should have_link('Add account', href: new_account_path)
		end

		it "displays accounts" do
			render
			rendered.should have_content("pera")
			rendered.should have_content("djura")
		end

		it "displays add account to project link" do
			render
			rendered.should have_xpath("//a[text()='Add to project']
				[@href='/project_members?account_id=#{account1.id}&project_id=#{project.id}']")
			rendered.should have_xpath("//a[text()='Add to project']
				[@href='/project_members?account_id=#{account2.id}&project_id=#{project.id}']")
		end
	end

	describe "members section" do
		before :each do
			project.stub(:accounts).and_return [member1, member2]
		end

		it "displays remove member link" do
			render
			rendered.should have_xpath("//a[text()='Remove from project']
				[@href='/project_members/#{project.id}?account_id=#{member1.id}']")
			rendered.should have_xpath("//a[text()='Remove from project']
				[@href='/project_members/#{project.id}?account_id=#{member2.id}']")
		end

		it "displays members" do
			render
			rendered.should have_content("srki")
			rendered.should have_content("miki")
		end
	end

end

def displays_feature_options(project, feature)
	rendered.should have_link("Delete", href: project_feature_path(project, feature))
	rendered.should have_link("Show", href: project_feature_path(project, feature))
end
