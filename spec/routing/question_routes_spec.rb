require 'spec_helper'

describe "Routes" do
  context "Question" do
    it "routes /surveys/:survey_id/questions/new to questions#new http_method#get" do
      expect(get: '/surveys/1/questions/new').to route_to(controller: 'questions', action: 'new', survey_id: '1')
    end

    it "routes /surveys/:survey_id/questions to questions#new http_method#post" do
      expect(post: '/surveys/1/questions').to route_to(controller: 'questions', action: 'create', survey_id: '1')
    end
  end
end