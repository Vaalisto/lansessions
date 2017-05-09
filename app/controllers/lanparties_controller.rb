class LanpartiesController < ApplicationController
  before_action :set_lanparty, only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_signed_in, expect: [:index, :show, :list]

  # GET /lanparties
  # GET /lanparties.json
  def index
    @lanparties = Lanparty.all
  end

  # GET /lanparties/1
  # GET /lanparties/1.json
  def show
    @participants = Participant.where(lanparty_id: @lanparty.id)
    if current_user and current_user.lanparties.include? @lanparty
      @participant = Participant.where("user_id = ? and lanparty_id = ?", current_user.id, @lanparty.id).first
    else
      @participant = Participant.new
      @participant.lanparty = @lanparty
    end
  end

  # GET /lanparties/new
  def new
    @lanparty = Lanparty.new
  end

  # GET /lanparties/1/edit
  def edit
  end

  # POST /lanparties
  # POST /lanparties.json
  def create
    @lanparty = Lanparty.new(lanparty_params)

    respond_to do |format|
      if @lanparty.save
        format.html { redirect_to @lanparty, notice: 'Lanparty was successfully created.' }
        format.json { render :show, status: :created, location: @lanparty }
      else
        format.html { render :new }
        format.json { render json: @lanparty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lanparties/1
  # PATCH/PUT /lanparties/1.json
  def update
    respond_to do |format|
      if @lanparty.update(lanparty_params)
        format.html { redirect_to @lanparty, notice: 'Lanparty was successfully updated.' }
        format.json { render :show, status: :ok, location: @lanparty }
      else
        format.html { render :edit }
        format.json { render json: @lanparty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lanparties/1
  # DELETE /lanparties/1.json
  def destroy
    @lanparty.destroy
    respond_to do |format|
      format.html { redirect_to lanparties_url, notice: 'Lanparty was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lanparty
      @lanparty = Lanparty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lanparty_params
      params.require(:lanparty).permit(:partyname, :address, :city, :startdate, :enddate, :description)
    end
end
