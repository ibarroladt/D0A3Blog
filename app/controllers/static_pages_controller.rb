class StaticPagesController < ApplicationController

  def home
    ids = Post.order('updated_at DESC').limit(5).pluck(:id)
    @posts = Post.where(id: ids)
  end

end
