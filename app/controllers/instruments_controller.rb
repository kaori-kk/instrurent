class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.all
  end

  def show
    @instrument = Instrument.find(params[:id])
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.save
    # redirect_to ????
  end

  def edit
    @instrument = Instrument.find(params[:id])
  end

  def update
    @instrument = Instrument.find(params[:id])
    @instrument.update(instrument_params)
    # redirect_to ????
  end

  def destroy
    @instrument = Instrument.find(params[:id])
    @instrument.destroy
    # redirect_to ????
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name, :price, :description, :photo)
  end

end


