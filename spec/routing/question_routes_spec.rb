require 'spec_helper'

describe "Routes" do
  context "Questions" do
    it "routes /surveys/:survey_id/questions/new to questions#new http_method#get" do
      expect(get: '/surveys/1/questions/new').to route_to(controller: 'questions', action: 'new', survey_id: '1')
    end

    it "routes /surveys/:survey_id/questions to questions#create http_method#post" do
      expect(post: '/surveys/1/questions').to route_to(controller: 'questions', action: 'create', survey_id: '1')
    end

    it "routes /surveys/:survey_id/questions/:id/edit to questions#edit http_method#get" do
      expect(get: '/surveys/1/questions/1/edit').to route_to(controller: 'questions', action: 'edit', survey_id: '1', id: '1')
    end

    it "routes /questions/:id to questions#destroy http_method#delete" do
      expect(delete: '/questions/1').to route_to(controller: 'questions', action: 'destroy', id: '1')
    end

    it "routes /surveys/:survey_id/questions to questions#update http_method#put" do
      expect(put: '/surveys/1/questions/1').to route_to(controller: 'questions', action: 'update', survey_id: '1', id: '1')
    end
  end
end