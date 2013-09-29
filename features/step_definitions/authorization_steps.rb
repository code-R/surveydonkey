Given(/^There is a confirmed user$/) do
  user = create(:user)
  user.confirm!
end

Given(/^There is a survey$/) do
  Survey.destroy_all
  @survey = create(:survey)
end

When(/^I visit survey page$/) do
  visit survey_path @survey
end

When(/^I visit survey create page$/) do
  visit new_survey_path
end

Then(/^I should be able to view the page$/) do
  page.current_path.should == survey_path(@survey)
end

Then(/^I should see invalid authorization message$/) do
  page.should have_content 'You are not authorized to access this page.'
end


When(/^I login as admin$/) do
  admin = create(:admin)
  admin.confirm!
  login(email: admin.email, password: 'changeme')
end

Then(/^I should have acess to survey create page$/) do
  page.current_path.should == new_survey_path
end

Then(/^I should not see edit and destroy links$/) do
  page.should_not have_selector(:link_or_button, 'Edit')
  page.should_not have_selector(:link_or_button, 'Destroy')
end

Then(/^I should see edit and destroy links$/) do
  page.should have_selector(:link_or_button, 'Edit')
  page.should have_selector(:link_or_button, 'Destroy')
end

Given(/^I visit home page$/) do
  visit root_path
end

Then(/^I should not see add survey link$/) do
  page.should_not have_content "New Survey"
end

Then(/^I should not see list of Questions$/) do
  question_description = Question.last.description

  page.should_not have_css('#questions-table')
  page.should_not have_content question_description
end

