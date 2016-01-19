class PostsInCategoriesController < ApplicationController

  def new
    @p_categories = Category.where(core: true)
    @n_categories = Category.where(core: false)
    @posts_in_cat = []
  end

end
