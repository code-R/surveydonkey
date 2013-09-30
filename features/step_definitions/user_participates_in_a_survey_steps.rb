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

When(/^I answer all survey questions$/) do
  survey = Survey.last
  number_of_questions_in_survey = survey.questions.size

  number_of_questions_in_survey.times do
    fill_in 'question_response_answer', :with => Date.today
    click_button('Submit')
  end
end
