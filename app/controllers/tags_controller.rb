class TagsController < ApplicationController

  # before_action :correct_user

  def index
    @tags       = Post.tag_counts
    @categories = Post.category_counts
  end

  def destroy
    ActsAsTaggableOn::Tag.find(params[:id]).destroy
    redirect_to tags_path
  end
  
end
