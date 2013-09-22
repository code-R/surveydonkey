FactoryGirl.define do
  factory :user do
    email 'vamsi@surveydonkey.com'
    password 'changeme'
    password_confirmation 'changeme'
    confirmed_at Time.now
  end
end
