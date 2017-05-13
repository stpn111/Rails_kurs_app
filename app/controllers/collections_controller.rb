class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show, :edit, :update, :destroy]
  #https://apidock.com/rails/ActionController/Filters/ClassMethods/before_filter
  before_action -> {check_auth ["admin", "operator"]}, except: [:show, :index]
  # GET /collections
  # GET /collections.json
  def index
    @collections = Collection.all
    @showrooms = Showroom.all
  end

  # GET /collections/1
  # GET /collections/1.json
  def show
  end

  # GET /collections/new
  def new
    @collection = Collection.new
    @showroom = Showroom.all
  end

  # GET /collections/1/edit
  def edit
	@showroom = Showroom.all
  end

  # POST /collections
  # POST /collections.json
  def create
    @collection = Collection.new(collection_params)
	@showrooms = []
	params[:collection][:showrooms].each{|a| @showrooms << Showroom.find(a) if a.present?}
    respond_to do |format|
      if @collection.save
		@showrooms.each{|a| a.collections << @collection if !(@collection.showrooms.include?(@showroom))}
        format.html { redirect_to @collection, notice: 'Коллекция успешно создана.' }
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
	@showrooms = []
	params[:collection][:showrooms].each{|a| @showrooms << Showroom.find(a) if a.present?}
    respond_to do |format|
      if @collection.update(collection_params)
		@showrooms.each{|a| a.collections << @collection if !(a.collections.include?(@collection))}
        format.html { redirect_to @collection, notice: 'Коллекция успешно обновлена.' }
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
      format.html { redirect_to collections_url, notice: 'Коллекция удалена' }
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
      params.require(:collection).permit(:colname, :shdescription, :begindate, :enddate,
      showrooms_attributes: [:id, :roomname, :_destroy])
    end
end
