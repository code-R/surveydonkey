Given(/^Survey has a Date Question$/) do
  survey = Survey.last
  create(:date_question, survey: survey)
end

Then(/^I should see datepicker type input$/) do
  page.has_css?('#new_question_response input.date_picker').should be_present
end