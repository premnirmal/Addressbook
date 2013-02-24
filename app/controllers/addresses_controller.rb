class AddressesController < ApplicationController
  # GET /addresses
  # GET /addresses.json
  respond_to :html, :json

  before_filter -> {@entry = Entry.find(params[:entry_id])}

  def index
    respond_with(@address=@entry.addresses.all)
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
    @addresses = @entry.addresses.find(params[:id])
    respond_with {(@addresses)}
  end

  # GET /addresses/new
  # GET /addresses/new.json
  def new
    @address = @entry.addresses.new
    respond_with(@address)
  end

  # GET /addresses/1/edit
  def edit
    @address = @entry.addresses.find(params[:id])
  end

  # POST /addresses
  # POST /addresses.json
  def create
    @address = @entry.addresses.new(params[:address])
    flash[:notice] = "Address created" if @address.save
    respond_with(@entry,@address)
  end

  # PUT /addresses/1
  # PUT /addresses/1.json
  def update
     @address = @entry.addresses.find(params[:id])
    respond_to do |format|
      if @address.update_attributes(params[:address])
        format.html { redirect_to :action => 'show'}#, :notice => 'Address was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => 'edit' }
        format.json { render :json => @address.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @address = @entry.addresses.find(params[:id])
    @address.destroy

    respond_to do |format|
      format.html { redirect_to entry_addresses_url }
      format.json { head :no_content }
    end
  end
end
