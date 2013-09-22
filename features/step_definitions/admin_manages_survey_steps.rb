When(/^fill in survey information$/) do
  Survey.destroy_all
  fill_in 'survey_title', :with => 'sample title'
  fill_in 'survey_description', :with => 'foo bar blah blah'
end

When(/^I click submit$/) do
  click_on 'Create Survey'
end

Then(/^I should see survey create message$/) do
  page.should have_content 'Survey was successfully created.'
end

Then(/^survey should be added$/) do
  Survey.count.should == 1
end