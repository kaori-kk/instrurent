class RequestsController < ApplicationController
  def show
    @request = Request.find(params[:id])
    @instrument = @request.instrument
  end
end
