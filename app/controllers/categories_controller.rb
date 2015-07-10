class CategoriesController < ApplicationController
  before_filter :authenticate_admin!, except: [:index, :show]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category successfully added!"
      redirect_to categories_path
    else
      render :new
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
    if @category.update(category_params)
      flash[:notice] = "Category successfully edited!"
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    @catgory = Category.find(params[:id])
    @catgory.destroy
    redirect_to categories_path
    flash[:notice] = "Category successfully deleted!"
  end

  private
  def category_params
    params.require(:category).permit(:name, :description)
  end

end
