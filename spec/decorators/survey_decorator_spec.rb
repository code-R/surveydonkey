require 'spec_helper'

describe SurveyDecorator do
  let(:survey) { FactoryGirl.create(:survey) }
  let(:decorated_survey) { SurveyDecorator.decorate(survey) }

  context "#title_link" do
    it "should return title link" do
      decorated_survey.title_link.should == "<a href=\"/surveys/1\">sample survey</a>"
    end
  end

  context "#truncated_description" do
    it "should return truncated description if it is too long" do
      survey.description = 'aa'*25
      decorated_survey.truncated_description.should == 'aaaaaaaaaaaaaaaaaaaaaaaaaaa...'
    end

    it "should return truncated description if it is too long" do
      survey.description = 'aa'*10
      decorated_survey.truncated_description.should == 'aa'*10
    end
  end
end
