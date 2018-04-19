class CategoriesController < ApplicationController

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

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.assign_attributes(category_params)
    if @category.save
      redirect_to category_path(@category)
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:status] = :success
    flash[:result_text] = "Successfully destroyed #{@category.name}"
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
