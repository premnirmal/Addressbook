# spec/controllers/feedbacks_controller_spec.rb
require 'spec_helper'

describe FeedbacksController do

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new feedback" do
        expect{
          post :create, feedback: FactoryGirl.attributes_for(:feedback) # create 2 feedbacks
          post :create, feedback: FactoryGirl.attributes_for(:feedback)
        }.to change(Feedback,:count).by(2) # check change in count
      end
      it "redirects to the home page (entries url)" do
        post :create, feedback: FactoryGirl.attributes_for(:feedback)
        response.should redirect_to entries_url
      end
    end    
    context "with invalid attributes" do
      it "does not save the new feedback" do
        expect{
          post :create, feedback: FactoryGirl.attributes_for(:invalid_feedback)
        }.to_not change(Feedback,:count)
      end    
    end 
  end
    
  describe 'DELETE destroy' do
    before :each do
      @feedback = FactoryGirl.create(:feedback)
    end
    it "deletes the feedback" do
      expect{
        delete :destroy, id: @feedback        
      }.to change(Feedback,:count).by(-1)
  end
    it "redirects to feedbacks#index" do
      delete :destroy, id: @feedback
      response.should redirect_to entries_url
    end
  end

end
