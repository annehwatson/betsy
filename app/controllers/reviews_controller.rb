class ReviewsController < ApplicationController
  # before_action :find_product, only: [:new, :create]
  skip_before_action :require_login

  def new
    #needs validation on session[:user_id] to check that they aren't reviewing their own product they sell; is user_id on product the seller?
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # @review.product = @product
    # if @review.save
    #   flash[:success] = "Successfully created review"
    #   redirect_to product_path(@review.product)
    # else
    #   flash.now[:error] = "Could not create new review"
    #   render :new, status: :bad_request
    @review.product_id = @product.id #added this line back
    if @login_user && @login_user.products.include?(@review.product)
    # if session[:user_id] = @product.user_id
      flash[:error] = "You can't review your own products!"
      redirect_to product_path(@review.product)

    elsif @review.save
      flash[:success] = "Successfully created review"
      redirect_to product_path(@product)
    else
      flash.now[:error] = "Could not create Review"
      render :new, status: :bad_request
    end
  end

  private

  def review_params
    return params.require(:review).permit(:rating, :product_id, :review)
  end

end
