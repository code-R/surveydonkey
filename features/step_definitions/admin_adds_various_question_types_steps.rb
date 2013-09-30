When(/^I fill in "(.*?)" Question details$/) do |question_type|
  fill_in 'question_description', with: 'first question'
  select(question_type, from: 'question_humanized_question_type')
end

Then(/^I should see "(.*?)" type in the page$/) do |question_type|
  within('#questions-table') do
    page.should have_content question_type
  end
end