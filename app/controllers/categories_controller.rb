class CategoriesController < ApplicationController

  before_action :signed_in_user, only: [:index]

  def index
    if params[:tag]
      @tags         = Post.tagged_with(params[:tag])
    else
      @tags         = Post.tag_counts
      @categories   = Post.category_counts
      @p_categories = Category.all
    end
  end

end
