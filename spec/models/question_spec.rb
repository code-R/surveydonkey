require 'spec_helper'

describe Question do
  accessible_attributes = %w(description survey_id humanized_question_type)
  subject { Question.new }
  let(:user) { user = FactoryGirl.build(:user) }

  context "Accesible" do
    accessible_attributes.each do |attr|
      it { should be_accessible attr }
    end

    protected_attributes = Survey.new.attributes.keys - accessible_attributes

    protected_attributes.each do |attr|
      it { should_not be_accessible attr }
    end
  end

  context "validations" do
    %w(description survey_id type).each do |attr|
      it { should validate_presence_of attr}
    end
  end

  context "associations" do
    it { should belong_to(:survey) }
  end

  context "#humanized_question_type" do
    it "return humanized question type" do
      FactoryGirl.build(:date_question).humanized_question_type.should == 'Date'
    end

    it "return nil if question type is not set" do
      q = Question.new
      q.humanized_question_type.should be_nil
    end

    it "set question type based on RAILS STI" do
      q = Question.new
      q.type.should be_nil
      q.humanized_question_type = 'date'
      q.type.should == 'Question::DateType'
    end
  end
end
