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

Given(/^Survey has (\d+) multiple choice questions and options$/) do |number|
  survey = Survey.last
  3.times do
    question = create(:multiple_choice_radio_button_question, survey_id: survey.id)
    create(:option, question_id: question.id)
    create(:option, question_id: question.id)
  end
end

When(/^second question depends on first question and third question depends on second$/) do
  q1, q2, q3 = Question.all

  q2.parent = q1
  q2.dependent_option = q1.options.first.name
  q2.comparator = true
  q2.save

  q3.parent = q2
  q3.dependent_option = q2.options.first.name
  q3.comparator = false
  q3.save
end

When(/^I try to edit first question to depend on third question$/) do
  q = Question.first
  visit edit_survey_question_path(q.survey, q)

  select(Question.last.description, :from => 'question_parent_id')
end
