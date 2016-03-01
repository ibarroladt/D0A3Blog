class PostsController < ApplicationController

  before_action :signed_in_user, except: [:show, :index]

  #/posts
  def index
    @posts = Post.all.where(publish: true)
  end

  def show
    @post = Post.friendly.find(params[:id])
  end

  def edit
    @post = Post.friendly.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Artículo creado exitósamente"
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def update
    @post = Post.friendly.find(params[:id])
    if @post.update_attributes(post_params)
      # @tag = "R_#{current_user.name}"
      @post.tag_list.add(@tag)
      @post.save
      flash[:success] = "Actualización exitosa"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    Post.friendly.find(params[:id]).destroy
    flash[:success] = "Artículo borrado"
    redirect_to posts_path
  end

  def unpublished
    @posts = Post.all.where(publish: false)
  end

  private

    def post_params
      params.require(:post).permit(:title, :summary, :content, :avatar, :publish, 
        :tag_list, :category_list)
    end

end
