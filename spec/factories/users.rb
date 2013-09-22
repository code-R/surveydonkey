FactoryGirl.define do
  factory :user do
    email 'vamsi@surveydonkey.com'
    password 'changeme'
    password_confirmation 'changeme'
    confirmed_at Time.now
  end

  factory :admin, class: User do
    email 'admin@surveydonkey.com'
    password 'changeme'
    password_confirmation 'changeme'
    confirmed_at Time.now
    role 'admin'
  end
end
