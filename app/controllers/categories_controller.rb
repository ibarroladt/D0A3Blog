class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
    begin
      @category = Category.friendly.find(params[:id])
    rescue
      flash[:danger] = "Esa categoría no se puede editar"
      redirect_to posts_path
    end
  end

  def show
    category = Category.friendly.find(params[:id])
    @category = ActsAsTaggableOn::Tag.find_by_name(category.name)
    if @category
      @category
    else
      @category = Category.friendly.find(params[:id])
    end
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
