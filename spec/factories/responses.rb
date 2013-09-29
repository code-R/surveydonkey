FactoryGirl.define do
  factory :response do
    sequence :answer do |n|
      "#{question.description} answer"
    end
    question do
      create(:question)
    end
    user
  end
end
