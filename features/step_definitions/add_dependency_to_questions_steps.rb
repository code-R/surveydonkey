When(/^I visit question new page$/) do
  visit new_survey_question_path(Survey.last)
end

Then(/^I should see questions select box$/) do
  page.should have_css('form#new_question select#question_parent_id')
end

When(/^I select some question as a parent$/) do
  fill_in('Description', :with => 'Question Description')
  select(Question.last.description, :from => 'Parent')
end

Then(/^I should see parent information under the question$/) do
  parent = Question.last.parent
  page.all('#questions-table tr')[4].should have_content(parent.description)
end