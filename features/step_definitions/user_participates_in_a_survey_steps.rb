Then(/^I should find participate link$/) do
  find_link('Participate').visible?
end

When(/^Survey has no questions$/) do
  Survey.last.questions.destroy_all
end

Then(/^I should start on survey$/) do
  survey = Survey.last
  question = survey.questions.first

  page.current_path.should == new_question_response_path(question)
end