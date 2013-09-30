When(/^Survey has a "(.*?)" Question$/) do |question_type|
  survey = Survey.last
  survey.questions.destroy_all
  create(:"#{question_type}_question", survey: survey)
end

Then(/^I should see "(.*?)" type input$/) do |input_type|
  find("#question_response_answer")[:class].include?(input_type).should be
end

When(/^I answer with some text$/) do
  fill_in 'question_response_answer', :with => 'answer'
  click_button('Submit')
end

Then(/^I should see invalid "(.*?)" message$/) do |question_type|
  page.should have_content "is not a #{question_type}"
end