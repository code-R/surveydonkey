Then(/^I should see options area$/) do
  within('#new_question') do
    page.should have_selector('#question_option_names', visible: true)
  end
end

Then(/^I should not see options area$/) do
  within('#new_question') do
    page.should have_selector('#question_option_names', visible: false)
  end
end

When(/^I fill in option details$/) do
  fill_in 'question_option_names', with: "choice 1\r\nchoice 2\r\nchoice 3"
end

Then(/^I should see options on that question$/) do
  visit question_path(Question.last)

  page.should have_content('choice 1')
  page.should have_content('choice 2')
end

When(/^I visit survey edit page$/) do
  visit edit_survey_question_path(Survey.last, Question.last)
end

Then(/^I should see options prefilled in the page$/) do
  find_field(:question_option_names).value.should == "choice 1\nchoice 2\nchoice 3"
end

Given(/^it has various options$/) do
  question = Question::MultipleChoiceRadioButtonType.last
  3.times { create(:option, question_id: question.id) }
end

Then(/^I should see multiple_choice_radio_button type input$/) do
  page.has_css?('.form-inputs ol li input.multiple_choice_radio_button')
end