require 'spec_helper'

describe "features/show.html.erb" do
	
	let(:feature) { stub_model(Feature, name: "new_feature")}

	it "displays project details" do
		assign(:feature, feature)
		render
		rendered.should have_selector('h1', text: feature.name)
		rendered.should have_selector('p', text: feature.description)
	end

end
