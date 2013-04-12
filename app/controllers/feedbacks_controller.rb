class FeedbacksController < ApplicationController
  # GET /feedbacks
  # GET /feedbacks.json
  respond_to :html
  before_filter :get_feedbacks

  def get_feedbacks
    @feedback = Feedback.all
  end

  def index
   respond_with (@feedbacks = Feedback.all)
  end

  # GET /feedbacks/1
  # GET /feedbacks/1.json
  def show
    @feedback = Feedback.find(params[:id])
    respond_with(@feedback)
  end

  # GET /feedbacks/new
  # GET /feedbacks/new.json

  def new
    @feedback = Feedback.new
    respond_with(@feedback)
  end

  # GET /feedbacks/1/edit
  def edit
    @feedback = Feedback.find(params[:id])
  end

  # POST /feedbacks
  # POST /feedbacks.json
  def create
    @feedback = Feedback.new(params[:feedback])
    if @feedback.save
      redirect_to entries_url, :notice => "Feedback created"
    else
      redirect_to entries_url, :notice => "Fields missing"
    end
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  def destroy
    @feedback = Feedback.find(params[:id])
    @feedback.destroy
    respond_to do |format|
      format.html { redirect_to entries_url }
      format.json { head :no_content }
    end
  end
end
