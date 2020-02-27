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
    my_requests
    all_requests
  end

  def request_accepted?
    @requests.accepted
  end

  # POST /requests/:id/accept
  def accept
    @request = Request.find(params[:id])
    @request.accepted = 'accepted'
    @request.save
    redirect_to profile_path
  end

  def decline
    @request = Request.find(params[:id])
    @request.accepted = 'declined'
    @request.save
    redirect_to profile_path
  end

end
