class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @request = Request.find(params[:request_id])
  end

  def create
    @review = Review.new(review_params)
    @request = Request.find(params[:request_id])
    if current_user.id == @request.user_id
      @review.request = @request
      if @review.save
        redirect_to instrument_path(@review.request.instrument)
      else
        render :new
      end
    else
      # flash[:notice] = 'You are not authorized to do this.'
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def review_params
    params.require(:review).permit(:instrument_stars, :instrument_review)
  end

end


