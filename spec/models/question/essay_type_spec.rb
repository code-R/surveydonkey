require 'spec_helper'

describe Question::EssayType do
  context "#qtype" do
    it "return humanized question type" do
      build(:essay_question).humanized_question_type.should == 'Essay type'
    end

    it "set question type based on RAILS STI" do
      q = Question.new(qtype: 'essay')
      q.type.should == 'Question::EssayType'
    end
  end
end
