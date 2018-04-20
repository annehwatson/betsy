class CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:status] = :success
      flash[:result_text] = "Successfully created #{@category.name}"
      redirect_to categories_path
    else
      flash[:status] = :failure
      flash[:result_text] = "Could not create #{@category.name}"
      flash[:messages] = @category.errors.error_messagesrender :new, status: :bad_request
    end
  end

  def show; end

  def edit; end

  def update
    @category.assign_attributes(category_params)
    if @category.save
      redirect_to category_path(@category)
    end
  end

  def destroy
    if @login_user #maybe admin_user in future?
      @category.destroy
      flash[:status] = :success
      flash[:result_text] = "Successfully destroyed #{@category.name}"
      redirect_to categories_path
    else
      flash[:status] = :failure
      flash[:result_text] = "You do not have permission to delete a category"
      #render_401
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category = Category.find_by(id: params[:id])

    head :not_found unless @category
  end

end
