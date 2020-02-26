class DashboardController < ApplicationController
# before_action :find_user

  def my_requests
    # All requests that the current_user made
    @my_requests = current_user.requests
  end

  def all_requests
    #Instruments belong to current user
    profile
    @requests = []
    all_my_instruments = Instrument.where(user_id: @user.id)
    all_my_instruments.each do |instrument|
    @requests << instrument.request
    end
    # @requests = Request.select(params[:id])
  end

  def profile
    @user = current_user
  end
end
