class DashboardController < ApplicationController
# before_action :find_user

  def my_requests
    # All requests that the current_user made
    @my_requests = current_user.requests
  end

  def all_requests
    #Instruments belong to current user
    @user = current_user
    @requests = []
    all_my_instruments = Instrument.where(user_id: @user.id)

    all_my_instruments.each do |instrument|
    @requests << instrument.requests if instrument.requests != nil
    end

    @requests.flatten!
  end

  def profile
    @user = current_user
  end

  def request_accepted?
    @requests.accepted
  end

  def accept_request
    request = Request.find(params[:request_id])
    request.accepted = true
    request.save
  end

end
