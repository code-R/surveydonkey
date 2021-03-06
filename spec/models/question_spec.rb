require 'spec_helper'

describe Question do
  accessible_attributes = %w(description survey_id qtype option_names is_required dependent_option parent_id comparator)
  subject { Question.new }
  let(:user) { user = build(:user) }

  context "Accesible" do
    accessible_attributes.each do |attr|
      it { should be_accessible attr }
    end

    protected_attributes = Question.new.attributes.keys - accessible_attributes

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
    it { should have_many(:responses).dependent(:destroy) }
  end

  it "should return model_name as question" do
    Question.model_name.should == 'question'
  end

  context "#qtype" do
    it "return nil if question type is not set" do
      q = Question.new
      q.qtype.should be_nil
    end

    it "should raise exception is the question type is set to nil" do
      expect { Question.new(qtype: nil) }.to raise_error('Should set Question Type')
    end
  end

  context "#required!" do
    let(:question) { Question.new }

    it "should set the status as required" do
      question.should_not be_is_required
      question.required!
      question.should be_is_required
    end
  end

  context "#required!" do
    let(:question) { Question.new(is_required: true) }

    it "should set the status as required" do
      question.should be_is_required
      question.optional!
      question.should_not be_is_required
    end
  end
end
