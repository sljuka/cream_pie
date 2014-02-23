Feature: Showing projects
	As a project manager
	I want to see projects that are being worked
	So that I can see detailed info of a project I'm intereseted in.

	Scenario: Show all projects when visiting projects page
		Given a project with name "MyProject" is being worked
		When I visit the projects page
		Then I should see the project "MyProject" in list

