class PostsController < ApplicationController

  #/posts
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Artículo creado exitósamente"
      redirect_to @post
    else
      render 'new'
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :summary, :content, :photo, :publish)
    end


end
