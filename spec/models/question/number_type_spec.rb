require 'spec_helper'

describe Question::NumberType do
  context "#humanized_question_type" do
    it "return humanized question type" do
      build(:number_question).humanized_question_type.should == 'Number type'
    end

    it "set question type based on RAILS STI" do
      q = Question.new(qtype: 'number')
      q.type.should == 'Question::NumberType'
    end
  end
end
