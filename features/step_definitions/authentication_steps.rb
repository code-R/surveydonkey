require 'pry'
Given(/^There is no user$/) do
  User.destroy_all
end

When(/^I sign in with valid email and password$/) do
  visit new_user_session_path
  fill_in 'Email', :with => 'vamsi@surveydonkey.com'
  fill_in 'Password', :with => 'changeme'
  click_button 'Sign in'
end

Then(/^I see an error message$/) do
  page.should have_content 'Invalid email or password.'
end

Then(/^I should be in login page$/) do
  page.current_path.should == new_user_session_path
end
