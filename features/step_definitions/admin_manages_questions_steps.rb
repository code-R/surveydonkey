When(/^I fill in Question details$/) do
  fill_in 'question_description', with: 'first question'
  select('date', from: 'question_humanized_question_type')
end

When(/^I visit survey page as admin$/) do
  @survey = Survey.last
  visit survey_path @survey
end

Given(/^Survey has some questions added$/) do
  3.times { create(:date_question, survey: @survey) }
end

Then(/^I should see list of Questions$/) do
  question_description = Question.last.description
  within('#questions-table') do
    page.should have_content question_description
  end
end

Then(/^I should see edit and destroy links on a question$/) do
  within('#questions-table') do
    page.should have_content 'Edit'
    page.should have_content 'Destroy'
  end
end

When(/^I click destroy on a question$/) do
  within "#questions-table" do
    first(:link, 'Destroy').click
  end
end

When(/^I click edit on a question$/) do
  within "#questions-table" do
    first(:link, 'Edit').click
  end
end

Then(/^I should go to question edit page$/) do
  page.current_path == 'edit'
end

When(/^I visit question edit page$/) do
  question = @survey.questions.first
  visit edit_survey_question_path(@survey, question)
end

When(/^I fill in question info$/) do
  fill_in 'question_description', with: 'question updated'
end
