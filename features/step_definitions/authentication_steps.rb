def destroy(email)
  user = User.find_by_email email
  user.destroy if user
end

def register(attrs)
  email = attrs[:email]
  password = attrs[:password] || 'changeme'
  password_confirmation = attrs[:password_confirmation] || password
  destroy('vamsi@surveydonkey.com')
  visit new_user_registration_path
  fill_in 'user_email', with: email
  fill_in 'user_password', with: password
  fill_in 'user_password_confirmation', with: password_confirmation
  click_button 'Sign up'
end

def login(attrs)
  email = attrs[:email]
  password = attrs[:password]

  visit new_user_session_path
  fill_in 'Email', :with => email
  fill_in 'Password', :with => password
  click_button 'Sign in'
end

Given(/^There is no user$/) do
  User.destroy_all
end

When(/^I sign in with valid email and password$/) do
  login(email: 'vamsi@surveydonkey.com', password: 'changeme')
end

Then(/^I see an error message$/) do
  page.should have_content 'Invalid email or password.'
end

Then(/^I should see invalid message$/) do
  page.should have_content 'Invalid email or password.'
end

Given(/^I am not logged in$/) do
  visit destroy_user_session_path
end

When(/^I register with valid email "(.*?)"$/) do |email|
  register(email: 'vamsi@surveydonkey.com')
end

Then(/^I should receive confirmation email$/) do
  confirmation_mail = ActionMailer::Base.deliveries.last
  confirmation_mail.subject.should == 'Confirmation instructions'
end

Then(/^user account should be created with email "(.*?)"$/) do |email|
  User.find_by_email(email).should be
end

When(/^I register with invalid email$/) do
  register(email: 'vamsi.com')
end

Then(/^I should see invalid email message$/) do
  page.should have_content 'Emailis invalid'
end

When(/^I sign up without a password$/) do
  register(email: 'vamsi.com', password: '')
end

Then(/^I should see a missing password message$/) do
  page.should have_content "Passwordcan't be blank"
end

When(/^I sign up with a mismatched password confirmation$/) do
  register(email: 'vamsi@surveydonkey.com', password: 'changeme', password_confirmation: 'different')
end

Then(/^I should see a mismatched password message$/) do
  page.should have_content "Passworddoesn't match confirmation"
end

When(/^I sign in with a wrong email$/) do
  destroy('vamsi2@surveydonkey.com')
  login(email: 'vamsi2@surveydonkey.com', password: 'changeme')
end

When(/^I sign in with a wrong password$/) do
  login(email: 'vamsi@surveydonkey.com', password: 'different')
end

Then(/^I should see confirmation_error message$/) do
  page.should have_content 'You have to confirm your account before continuing.'
end

When(/^I confirm the account$/) do
  user = User.find_by_email('vamsi@surveydonkey.com')
  user.confirm!
end

Then(/^I should see success message$/) do
  page.should have_content 'Signed in successfully.'
end
