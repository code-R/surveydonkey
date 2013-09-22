Given(/^There is a confirmed user$/) do
  user = FactoryGirl.create(:user)
  user.confirm!
end

Given(/^There is a survey$/) do
  @survey = FactoryGirl.create(:survey)
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
  admin = FactoryGirl.create(:admin)
  admin.confirm!
  login(email: admin.email, password: 'changeme')
end

Then(/^I should have acess to survey create page$/) do
  page.current_path.should == new_survey_path
end