When(/^I fill in Question details$/) do
  fill_in 'question_description', :with => 'first question'
  select('date', :from => 'question_humanized_question_type')
end

When(/^I visit survey page as admin$/) do
  @survey = Survey.last
  visit survey_path @survey
end

Given(/^Survey has some questions added$/) do
  FactoryGirl.create(:date_question, survey: @survey)
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
