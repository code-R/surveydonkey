When(/^I fill in Question details$/) do
  fill_in 'question_description', :with => 'first question'
  select('date', :from => 'question_type')
end