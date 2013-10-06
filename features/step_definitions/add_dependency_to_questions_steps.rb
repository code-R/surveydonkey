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
  page.all('#questions-table tr')[2].should have_content(parent.description)
end

Then(/^I should see question options in the page$/) do
  Question.last.options.each do |option|
    page.should have_content(option.name)
  end
end

When(/^I choose an option as a dependent option$/) do
  option = Option.last
  choose("dependent_option_#{option.id}")
end

Then(/^I should see depedent option information under the question$/) do
  page.all('#questions-table tr')[2].should have_content(Option.last.name)
end