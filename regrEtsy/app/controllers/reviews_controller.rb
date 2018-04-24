class ReviewsController < ApplicationController



  private
  def review_params
    return params.require(:review).permit(:rating, :review, :product_id)
  end
end
