# spec/controllers/entries_controller_spec.rb
require 'spec_helper'

describe EntriesController do

  describe "GET #index" do
    it "populates an array of entries in ascending order by last name" do
      entry = FactoryGirl.create(:entry)
      entry2 = FactoryGirl.create(:entry)
      get :index
      assigns(:entries).should eq([entry, entry2].sort{|a,b| a.last_name <=> b.last_name})
    end
    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested entry to @entry" do
      entry = FactoryGirl.create(:entry)
      get :show, id: entry
      assigns(:entry).should eq(entry)
    end
    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:entry)
      response.should render_template :show
    end
  end

  describe "GET #new" do
    it "assigns an instance of entry" do
      get :new
      assigns(:entry).should be_instance_of(Entry)
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new entry" do
        expect{
          post :create, entry: FactoryGirl.attributes_for(:entry) # create 2 entries
          post :create, entry: FactoryGirl.attributes_for(:entry)
        }.to change(Entry,:count).by(2) # check change in count
      end
      it "redirects to the new entry" do
        post :create, entry: FactoryGirl.attributes_for(:entry) # create 2 entries
        post :create, entry: FactoryGirl.attributes_for(:entry)
        # check if last create redirects to correct entry
        response.should redirect_to Entry.last
      end
    end    
    context "with invalid attributes" do
      it "does not save the new entry" do
        expect{
          post :create, entry: FactoryGirl.attributes_for(:invalid_entry)
        }.to_not change(Entry,:count)
      end    
      it "re-renders the new method" do
        post :create, entry: FactoryGirl.attributes_for(:invalid_entry)
        response.should render_template :new
      end
    end 
  end
  
  describe 'PUT update' do
    before :each do
      @entry = FactoryGirl.create(:entry, first_name: "Lawrence", last_name: "Smith")
    end
    context "GET #edit" do
      it "should assign @entry" do
        get :edit, id: @entry
        assigns[:entries].should == [@entry]
      end
    end
    context "valid attributes" do
      it "located the requested @entry" do
        put :update, id: @entry, entry: FactoryGirl.attributes_for(:entry)
        assigns(:entry).should eq(@entry)
      end
      it "changes @entry's attributes" do
        put :update, id: @entry,
        entry: FactoryGirl.attributes_for(:entry, first_name: "Larry", last_name: "Smith")
        @entry.reload
        @entry.first_name.should eq("Larry")
        @entry.last_name.should eq("Smith")
      end
      it "redirects to the updated entry" do
        put :update, id: @entry, entry: FactoryGirl.attributes_for(:entry)
        response.should redirect_to @entry
      end
    end
    context "invalid attributes" do
      it "locates the requested @entry" do
        put :update, id: @entry, entry: FactoryGirl.attributes_for(:invalid_entry)
        assigns(:entry).should eq(@entry)
      end
      it "does not change @entry's attributes" do
        put :update, id: @entry, entry: FactoryGirl.attributes_for(:invalid_entry)
        @entry.reload
        @entry.first_name.should eq("Lawrence")
        @entry.last_name.should eq("Smith")
      end
      it "re-renders the edit method" do
        put :update, id: @entry, entry: FactoryGirl.attributes_for(:invalid_entry)
        response.should render_template :edit
      end
    end
  end
  
  describe 'DELETE destroy' do
    before :each do
      @entry = FactoryGirl.create(:entry)
    end
    it "deletes the entry" do
      expect{
        delete :destroy, id: @entry        
      }.to change(Entry,:count).by(-1)
  end
    it "redirects to entrys#index" do
      delete :destroy, id: @entry
      response.should redirect_to entries_url
    end
  end

end
