When(/^I "(.*?)" question as required$/) do |action|
  send(action, 'Is required')
end

Then(/^I should see question as "(.*?)" in the questions page$/) do |status|
  within('#questions-table') do
    page.should have_content status
  end
end

Given(/^the question status is set as optional$/) do
  q = Question.last
  q.optional!
end