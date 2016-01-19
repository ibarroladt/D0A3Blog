class TagsController < ApplicationController

  # before_action :correct_user

  def index
    @tags = ActsAsTaggableOn::Tag.all
  end

  def destroy
    ActsAsTaggableOn::Tag.find(params[:id]).destroy
    redirect_to tags_path
  end
  
end
