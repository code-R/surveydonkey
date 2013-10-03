require 'spec_helper'

describe Question::DateType do
  context "#humanized_question_type" do
    it "return humanized question type" do
      build(:date_question).humanized_question_type.should == 'Date type'
    end

    it "set question type based on RAILS STI" do
      q = Question.new(qtype: 'date')
      q.type.should == 'Question::DateType'
    end
  end
end
