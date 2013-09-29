require 'spec_helper'

describe "Routes" do
  context "Responses" do
    it "routes /questions/:question_id/responses/new to Response#new http_method#get" do
      expect(get: '/questions/1/responses/new').to route_to(controller: 'responses', action: 'new', question_id: '1')
    end
  end
end