class RequestsController < ApplicationController
  def show
    @request = Request.find(params[:id])
    @instrument = @request.instrument
  end

  def new
    @instrument = Instrument.find(params[:instrument_id])
    @request = Request.new
  end

  def create
    @instrument = Instrument.find(params[:instrument_id])
    @request = Request.new(request_params)

    @request.user_id = current_user.id
    @request.instrument_id = @instrument.id

    if @request.save
      redirect_to request_path(@request)
    else
      render :new
    end
  end

    def accept
    @request = Request.find(params[:id])
    @request.status = 'accepted'
    @request.save
    redirect_to profile_path
  end


  def decline
    @request = Request.find(params[:id])
    @request.status = 'declined'
    @request.save
    redirect_to profile_path
  end

  private

  def request_params
    params.require(:request).permit(:user_id, :instrument_id, :start_date, :end_date)
  end

end
