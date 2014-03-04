require 'spec_helper'

describe "accounts/new.html.erb" do

	let(:account) { FactoryGirl.build(:account) }

	before do
		account.username = "newUsername"
		account.name = "newName"
		account.lastname = "newLastname"
		assign(:account, account)
	end

	it "displays a form for adding projects" do
		render
		rendered.should have_xpath("//form[@action='/accounts'][@method='post']")
		rendered.should have_css("input[type='text'][value='newUsername'][name='account[username]']")
		rendered.should have_css("input[type='text'][value='newName'][name='account[name]']")
		rendered.should have_css("input[type='text'][value='newLastname'][name='account[lastname]']")
	end

end
