class PostsController < ApplicationController

  #/posts
  def index
    @posts = Post.all
  end

  def show
  end

  def edit
  end

  def new
    @post = Post.new
  end

end
