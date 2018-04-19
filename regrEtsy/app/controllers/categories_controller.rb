class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new(name: params[:name])
  end

  def create
    category = Category.new(category_params)
    if category.save
      redirect_to categories_path
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])
    category.assign_attributes(category_params)
    if category.save
      redirect_to category_path(category)
    end
  end

  def destroy
    #should this also destroy all of the ProductCategory records that this category is on first
    Category.destroy(params[:id])
  end

  private

  def category_params
    return
    params.require(:category).permit(:name)
  end

end
