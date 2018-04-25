class CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :edit, :update, :destroy]
    skip_before_action :require_login, only: [:index, :show]
    skip_before_action :check_user, only: [:index, :show]
  def index
    @categories = Category.all
  end

  def new
    if @login_user
      @category = Category.new
    else
      flash[:error] = "You must be logged in to create a category"
      redirect_to categories_path
    end
  end

  def create
    # if @login_user
      @category = Category.new(category_params)

      if @category.save
        flash[:success] = "Successfully created #{@category.name}"
        redirect_to categories_path
      else
        flash.now[:error] = "Validations failed"
        render :new, status: :bad_request
      end
    # else
    #   flash.now[:error] = "You must be logged in to create a category"
    #   render :new, status: :unauthorized
    # end
  end

  def show; end

  def edit
    if !@login_user
      flash[:error] = "You must be logged in to update a category"
      redirect_to category_path(@category)
    end
  end

  def update
    if @login_user
      @category.assign_attributes(category_params)
      if @category.save
        redirect_to category_path(@category)
      else
        render :edit, status: :bad_request
      end
    else
      flash.now[:error] = "You must be logged in to update a category"
      render :edit, status: :unauthorized
    end
  end

  def destroy
    if @login_user
      @category.destroy
      flash[:success] = "Successfully destroyed #{@category.name}"
      redirect_to categories_path
    else
      flash[:error] = "You do not have permission to delete a category"
      redirect_to categories_path, status: :unauthorized
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
