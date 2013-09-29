FactoryGirl.define do
  factory :user do
    email 'vamsi@surveydonkey.com'
    password 'changeme'
    password_confirmation 'changeme'
  end

  factory :admin, class: User do
    email 'admin@surveydonkey.com'
    password 'changeme'
    password_confirmation 'changeme'
    role 'admin'
  end
end
