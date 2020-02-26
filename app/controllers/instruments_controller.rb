 class InstrumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]
  def index
    # If u have params instrument name, Instrument.where(....)
    # Else, Instrument.all
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
    @instrument.user = current_user
    if @instrument.save
      redirect_to instruments_path(@instrument)
    else
      render :new
    end
  end

  def edit
    if (current_user == @instrument.user)
      @instrument = Instrument.find(params[:id])
    else
      flash[:notice] = 'You are not authorized to do this.'
      redirect_to instruments_path
    end
  end

  def update
    if (current_user == @instrument.user)
      @instrument = Instrument.find(params[:id])
    else
      flash[:notice] = 'You are not authorized to do this.'
      redirect_to instruments_path
    end
    @instrument.update(instrument_params)
    redirect_to instrument_path(@instrument)
  end

  def destroy
    if (current_user == @instrument.user)
      @instrument = Instrument.find(params[:id])
    else
      flash[:notice] = 'You are not authorized to do this.'
      redirect_to instruments_path
    end
    @instrument.destroy
    redirect_to instruments_path
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name, :price, :description, :photo, :user_id)
  end

end


