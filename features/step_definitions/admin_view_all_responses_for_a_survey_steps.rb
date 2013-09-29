Given(/^questions has responses$/) do
  questions = Survey.last.questions
  user = create(:user)

  questions.each do |question|
    create(:response, question: question, user: user)
  end
end

Then(/^I should view view responses link$/) do
  find_link('View all responses').visible?
end

When(/^I visit survey responses page$/) do
  visit survey_responses_path(Survey.last)
end

Then(/^I should view list of responses$/) do
  page.should have_content Response.last.answer
end