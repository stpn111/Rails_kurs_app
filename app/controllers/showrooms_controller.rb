class ShowroomsController < ApplicationController
  before_action :set_showroom, only: [:show, :edit, :update, :destroy]
  #https://apidock.com/rails/ActionController/Filters/ClassMethods/before_filter
  before_action -> {check_auth ["admin", "operator"]}, except: [:show, :index]
  # GET /showrooms
  # GET /showrooms.json
  def index
    @showrooms = Showroom.all
  end

  # GET /showrooms/1
  # GET /showrooms/1.json
  def show
  end

  # GET /showrooms/new
  def new
    @showroom = Showroom.new
  end

  # GET /showrooms/1/edit
  def edit
  end

  # POST /showrooms
  # POST /showrooms.json
  def create
    @showroom = Showroom.new(showroom_params)

    respond_to do |format|
      if @showroom.save
        format.html { redirect_to @showroom, notice: 'Showroom was successfully created.' }
        format.json { render :show, status: :created, location: @showroom }
      else
        format.html { render :new }
        format.json { render json: @showroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /showrooms/1
  # PATCH/PUT /showrooms/1.json
  def update
    respond_to do |format|
      if @showroom.update(showroom_params)
        format.html { redirect_to @showroom, notice: 'Showroom was successfully updated.' }
        format.json { render :show, status: :ok, location: @showroom }
      else
        format.html { render :edit }
        format.json { render json: @showroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /showrooms/1
  # DELETE /showrooms/1.json
  def destroy
    @showroom.destroy
    respond_to do |format|
      format.html { redirect_to showrooms_url, notice: 'Showroom was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_showroom
      @showroom = Showroom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def showroom_params
      params.require(:showroom).permit(:roomname)
    end
end
