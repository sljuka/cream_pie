require 'spec_helper'

describe "features/index.html.erb" do

	let(:project) { FactoryGirl.create(:project) }
	let(:feature) { FactoryGirl.create(:feature)}
	let(:feature2) { FactoryGirl.create(:feature)}

	before :each do
		assign(:project, project)
	end

	it "displays the title" do
		render
		rendered.should have_xpath("//html/body/h1[text()='#{project.name} features']")
	end

	context "with 2 project features" do
		before(:each) do
			assign(:features, [feature, feature2])
		end



	end



end
