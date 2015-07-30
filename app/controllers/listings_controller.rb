class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_filter :check_user, only: [:edit, :update, :destroy]
include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  def seller
    @listings = Listing.where(user: current_user).order("created_at DESC")
    
  end
  
  def list
    @listings = Listing.paginate(:page => params[:page], :per_page => 4)
  end
  # GET /listings
  # GET /listings.json
  def index
    #@listings = Listing.order("created_at DESC").paginate(:page => params[:page], :per_page => 4)
    listings_scope = Listing.order("created_at DESC")
    listings_scope = listings_scope.like(params[:filter]) if params[:filter]
    @listings = smart_listing_create(:listings, listings_scope, partial: "listings/list" )
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def import
  Listing.import(params[:file])
  redirect_to listings_path, notice: "All good"
  end
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:name, :description, :price, :image)
    end
  
    def check_user
      if current_user != @listing.user
        redirect_to root_url, alert: "Sorry, you cannot change a listing that does not belong to you."
      end
    end
end
