require 'spec_helper'

describe "Routes" do
  context "Responses" do
    it "routes /questions/:question_id/responses/new to Response#new http_method#get" do
      expect(get: '/questions/1/responses/new').to route_to(controller: 'responses', action: 'new', question_id: '1')
    end

    it "routes /questions/:question_id/responses to Response#create http_method#post" do
      expect(post: '/questions/1/responses').to route_to(controller: 'responses', action: 'create', question_id: '1')
    end

    it "routes /survey/:survey_id/responses to Response#index http_method#get" do
      expect(get: '/surveys/1/responses').to route_to(controller: 'responses', action: 'index', survey_id: '1')
    end
  end
end