class EntriesController < ApplicationController
  # GET /entries
  # GET /entries.json
  respond_to :html
  before_filter :get_entries
  before_filter :find_entry, :only => [:show, :edit, :destroy, :update]
  
  def find_entry
    @entry = Entry.find(params[:id])
    params[:initial] = @entry.last_name[0]
  end

  def get_entries
    @entries = 
      Entry.where('substr(last_name,1,1)= ?',
                  params[:initial] || 'A').order('last_name, first_name')
    @feedbacks = Feedback.find(:all, :order => 'id DESC')
    @feedback = Feedback.new
  end
  
  def index
    respond_with (@entries = Entry.where('substr(last_name,1,1)= ?',
                                         params[:initial] || 'A').order('last_name, first_name'))
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
    @entry = Entry.find(params[:id])
    respond_with(@entry)
  end

  # GET /entries/new
  # GET /entries/new.json

  def new
    @entry = Entry.new
    respond_with(@entry)
  end

  # GET /entries/1/edit
  def edit
    @entry = Entry.find(params[:id])
  end
  
  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(params[:entry])
    flash[:notice] = "Entry created" if @entry.save
    respond_with(@entry)
  end

  # PUT /entries/1
  # PUT /entries/1.json
  def update
    @entry = Entry.find(params[:id])
    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.html { redirect_to @entry, :notice => 'Entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to entries_url }
      format.json { head :no_content }
    end
  end
end
