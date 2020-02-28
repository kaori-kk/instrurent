class DashboardController < ApplicationController
# before_action :find_user

  # def all_requests
  #   # requests = incoming
  #   #Instruments belong to current user
  #   @user = current_user
  #   @requests = []
  #   all_my_instruments = Instrument.where(user: @user)
  #   all_my_instruments.each do |instrument|
  #   @requests << instrument.request if instrument.request != nil
  #   end
  #   @requests.flatten!
  # end


  def profile
    @user = current_user
    @my_requests = current_user.outgoing_requests
    @requests = current_user.requests
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
    @request.status = 'declined'
    @request.save
    redirect_to profile_path
  end

end
