class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to request_reviews_path(@review)
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    require_owner!(@review)
  end

  def update
    @review = Review.find(params[:id])
    require_owner!(@review)

    @review.update(review_params)
    redirect_to request_reviews_path(@review)
  end

  def destroy
    @review = Instrument.find(params[:id])
    require_owner!(@review)

    @review.destroy
    redirect_to request_reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:request_id, :user_stars, :user:review, :intrument_stars, :instrument_review)
  end

  def require_owner!(review)
    if (current_user != instrument.user)
      flash[:notice] = 'You are not authorized to do this.'
      redirect_to request_reviews_path
    end
  end

end
