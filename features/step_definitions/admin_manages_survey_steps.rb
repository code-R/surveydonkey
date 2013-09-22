When(/^fill in survey information$/) do
  Survey.destroy_all
  fill_in 'survey_title', :with => 'sample title'
  fill_in 'survey_description', :with => 'foo bar blah blah'
end

When(/^I click submit$/) do

end

When(/^I click "(.*?)"$/) do |submit_btn|
  click_on submit_btn
end

Then(/^I should see "(.*?)"$/) do |message|
  page.should have_content message
end

Then(/^survey should be added$/) do
  Survey.count.should == 1
end

When(/^update survey information$/) do
  fill_in 'survey_title', :with => 'updated title'
  fill_in 'survey_description', :with => 'updated description'
end

When(/^I visit survey list page$/) do
  visit surveys_path
end