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