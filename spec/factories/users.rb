FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "vamsi#{n}@surveydonkey.com"
    end
    password 'changeme'
    password_confirmation 'changeme'

    factory :admin do
      role 'admin'
    end
  end
end
