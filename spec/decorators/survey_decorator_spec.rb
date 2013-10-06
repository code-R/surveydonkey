require 'spec_helper'

describe SurveyDecorator do
  let(:survey) { create(:survey) }
  let(:decorated_survey) { SurveyDecorator.decorate(survey) }

  context "#title_link" do
    it "should return title link" do
      decorated_survey.title_link.should == "<a href=\"/surveys/#{survey.id}\">sample survey</a>"
    end
  end

  context "#truncated_description" do
    it "should return truncated description if it is too long" do
      survey.description = 'aa'*25
      decorated_survey.truncated_description.should == 'aaaaaaaaaaaaaaaaaaaaaaaaaaa...'
    end

    it "should return untruncated description if it is short" do
      survey.description = 'aa'*10
      decorated_survey.truncated_description.should == 'aa'*10
    end
  end

  context "#edit_link" do
    it "should return edit link" do
      decorated_survey.edit_link.should == "<a href=\"/surveys/#{survey.id}/edit\" class=\"btn btn-mini btn-info\">Edit</a>"
    end
  end

  context "#destroy_link" do
    it "should return destroy link" do
      decorated_survey.destroy_link.should == "<a href=\"/surveys/#{survey.id}\" class=\"btn btn-mini btn-danger\" data-confirm=\"Are you sure?\" data-method=\"delete\" rel=\"nofollow\">Destroy</a>"
    end
  end

  context "#participate_link" do
    it "should return participate link" do
      decorated_survey.participate_link.should == "<a href=\"/surveys/1/participate\" class=\"btn btn-mini btn-success\">Participate</a>"
    end
  end
end
