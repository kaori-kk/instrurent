class DashboardController < ApplicationController
# before_action :find_user

  def my_requests
    # All requests that the current_user made
    @requests = current_user.requests
  end

  def all_requests
    raise
    @requests = Request.all
    # @requests = Request.select(params[:id])
  end

  def profile
    @user = current_user
  end
end
