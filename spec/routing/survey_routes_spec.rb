require 'spec_helper'

describe "Routes" do
  context "Surveys" do
    it "routes /surveys to surveys#index http_method#get" do
      expect(get: '/surveys').to route_to(controller: 'surveys', action: 'index')
    end

    it "routes /surveys/:id to surveys#show http_method#get" do
      expect(get: '/surveys/1').to route_to(controller: 'surveys', action: 'show', id: '1')
    end

    it "routes /surveys to surveys#create http_method#post" do
      expect(post: '/surveys').to route_to(controller: 'surveys', action: 'create')
    end

    it "routes /surveys/:id to surveys#update http_method#put" do
      expect(put: '/surveys/1').to route_to(controller: 'surveys', action: 'update', id: '1')
    end

    it "routes /surveys/new to surveys#new http_method#get" do
      expect(get: '/surveys/new').to route_to(controller: 'surveys', action: 'new')
    end

    it "routes /surveys/:id/edit to surveys#edit http_method#get" do
      expect(get: '/surveys/1/edit').to route_to(controller: 'surveys', action: 'edit', id: '1')
    end

    it "routes /surveys/:id to surveys#destroy http_method#delete" do
      expect(delete: '/surveys/1').to route_to(controller: 'surveys', action: 'destroy', id: '1')
    end

    it "routes /surveys/:id/participate to surveys#participate http_method#get" do
      expect(get: '/surveys/1/participate').to route_to(controller: 'surveys', action: 'participate', id: '1')
    end
  end
end