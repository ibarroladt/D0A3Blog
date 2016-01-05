class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.friendly.find(params[:id])
  end

  def show
    @category = Category.friendly.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Categoría creada exitósamente"
      redirect_to @category
    else
      render 'new'
    end
  end

  def update
    @category = Category.friendly.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = "Actualización exitosa"
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    Category.friendly.find(params[:id]).destroy
    flash[:success] = "Categoría borrada"
    redirect_to categorys_path
  end

  private

    def category_params
      params.require(:category).permit(:name, :core)
    end

end
