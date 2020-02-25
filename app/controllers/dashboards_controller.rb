class DashboardsController < ApplicationController
# before_action :find_user

  def my_requests
    # All requests that the current_user made
    @requests = ['a', 'b']

  end

  # def all_requests
  #   @requests = Request.all
  #   @requests = Request.select(params[:id])
  # end

  # def profile
  #   find_user
  # end

  # private

  # def find_user

  # @user = User.find(params[:user_id])

  # end
end



