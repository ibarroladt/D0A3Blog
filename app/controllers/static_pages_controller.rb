class StaticPagesController < ApplicationController

  def home
    @posts = Post.all.order('updated_at DESC').where(publish: true).paginate(page: params[:page], per_page: 10)
  end

end
