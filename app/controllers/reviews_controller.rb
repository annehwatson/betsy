class ReviewsController < ApplicationController
  # before_action :find_product, only: [:new, :create]
  skip_before_action :require_login
  skip_before_action :check_user

  def new
    #needs validation on session[:user_id] to check that they aren't reviewing their own product they sell; is user_id on product the seller?
    @review = Review.new(product_id: @product)
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
    if @review.save
      flash[:success] = "Successfully created review"
      redirect_to product_path(@product)
    else
      flash.now[:error] = "Could not create Review"
      render :new, status: :bad_request
    end
  end

  private
  # def find_product
  #   @product = Product.find_by(id: params[:product_id])
  #   unless @product
  #     head :not_found
  #   end
  # end

  def review_params
    return params.require(:review).permit(:rating, :product_id, :review)
  end

end
