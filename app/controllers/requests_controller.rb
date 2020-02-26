class RequestsController < ApplicationController
  def show
    @request = Request.find(params[:id])
    @instrument = @request.instrument
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
  end

  private

  def request_params
    params.require(:request).permit(:user_id, :instrument_id, :start_date, :end_date)
  end

end
