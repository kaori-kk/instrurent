 class InstrumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]
  def index
    if params[:instrument].present?
        @instruments = Instrument.basic_search(params[:instrument][:name])
    else
     @instruments = Instrument.all
    end
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
    @instrument = Instrument.find(params[:id])
    require_owner!(@instrument)
  end

  def update
    @instrument = Instrument.find(params[:id])
    require_owner!(@instrument)

    @instrument.update(instrument_params)
    redirect_to instrument_path(@instrument)
  end

  def destroy
    @instrument = Instrument.find(params[:id])
    require_owner!(@instrument)

    @instrument.destroy
    redirect_to instruments_path
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name, :price, :description, :photo, :user_id)
  end

  def require_owner!(instrument)
    if (current_user != instrument.user)
      flash[:notice] = 'You are not authorized to do this.'
      redirect_to instruments_path
    end
  end

end


