When(/^I answer first question with a not dependent option$/) do
  not_dependent_option = Survey.last.questions.first.options.last
  choose("question_response_answer_choice_#{not_dependent_option.id}")
end

When(/^I answer first question with a dependent option$/) do
  dependent_option = Survey.last.questions.first.options.first
  choose("question_response_answer_choice_#{dependent_option.id}")
end

Then(/^I should see second question in the survey$/) do
  second_question = Survey.last.questions[1]
  page.should have_content second_question.description
end

When(/^I answer second question with a dependent option$/) do
  dependent_option = Survey.last.questions[1].options.first
  choose("question_response_answer_choice_#{dependent_option.id}")
end

When(/^I answer second question with a dependent option with comparator is not$/) do
  dependent_option = Survey.last.questions[1].options.first
  choose("question_response_answer_choice_#{dependent_option.id}")
end

When(/^I answer second question with a non dependent option with comparator is not$/) do
  dependent_option = Survey.last.questions[1].options.last
  choose("question_response_answer_choice_#{dependent_option.id}")
end

Then(/^I should see third question in the survey$/) do
  third_question = Survey.last.questions[2]
  page.should have_content third_question.description
end