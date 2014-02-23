Given(/^a project with name "(.*?)" is being worked$/) do |name|
	@project = Project.new(name: name)
	@project.save!
end

When(/^I visit the projects page$/) do
	visit projects_path
end

Then(/^I should see the project "(.*?)" in list$/) do |name|
	page.has_content?(name)
end