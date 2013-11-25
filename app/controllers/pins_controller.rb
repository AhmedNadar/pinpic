class PinsController < ApplicationController
  before_action :set_pin, only: [:edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index]

  def index
    @pins = Pin.all
  end

  def show
    @pin = Pin.find(params[:id])
  end

  def new
    @pin = current_user.pins.new
  end

  def edit

  end

  def create
    @pin = current_user.pins.new(pin_params)

    respond_to do |format|
      if @pin.save
        format.html { redirect_to @pin, notice: 'Pin was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pin }
      else
        format.html { render action: 'new' }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @pin.update(pin_params)
        format.html { redirect_to @pin, notice: 'Pin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pin.destroy
    respond_to do |format|
      format.html { redirect_to pins_url, alert: 'Pin was deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = current_user.pins.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:description, :user_id)
    end
end
