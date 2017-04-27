class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show, :edit, :update, :destroy]

  # GET /collections
  # GET /collections.json
  def index
    @collections = Collection.all
<<<<<<< HEAD
=======
    @showrooms = Showroom.all
>>>>>>> 3b08d44ef54a364c95177681c24fb1a4794d5706
  end

  # GET /collections/1
  # GET /collections/1.json
  def show
  end

  # GET /collections/new
  def new
    @collection = Collection.new
<<<<<<< HEAD
=======
    @showroom = Showroom.all
>>>>>>> 3b08d44ef54a364c95177681c24fb1a4794d5706
  end

  # GET /collections/1/edit
  def edit
<<<<<<< HEAD
=======
	@showroom = Showroom.all
>>>>>>> 3b08d44ef54a364c95177681c24fb1a4794d5706
  end

  # POST /collections
  # POST /collections.json
  def create
    @collection = Collection.new(collection_params)
<<<<<<< HEAD

    respond_to do |format|
      if @collection.save
=======
	@showrooms = []
	params[:collection][:showrooms].each{|a| @showrooms << Showroom.find(a) if a.present?}
    respond_to do |format|
      if @collection.save
		@showrooms.each{|a| a.collections << @collection}
>>>>>>> 3b08d44ef54a364c95177681c24fb1a4794d5706
        format.html { redirect_to @collection, notice: 'Collection was successfully created.' }
        format.json { render :show, status: :created, location: @collection }
      else
        format.html { render :new }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collections/1
  # PATCH/PUT /collections/1.json
  def update
<<<<<<< HEAD
    respond_to do |format|
      if @collection.update(collection_params)
=======
	@showrooms = []
	params[:collection][:showrooms].each{|a| @showrooms << Showroom.find(a) if a.present?}
    respond_to do |format|
      if @collection.update(collection_params)
		@showrooms.each{|a| a.collections << @collection}.exists?
>>>>>>> 3b08d44ef54a364c95177681c24fb1a4794d5706
        format.html { redirect_to @collection, notice: 'Collection was successfully updated.' }
        format.json { render :show, status: :ok, location: @collection }
      else
        format.html { render :edit }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collections/1
  # DELETE /collections/1.json
  def destroy
    @collection.destroy
    respond_to do |format|
      format.html { redirect_to collections_url, notice: 'Collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @collection = Collection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collection_params
      params.require(:collection).permit(:colname, :shdescription, :begindate, :enddate)
    end
end
