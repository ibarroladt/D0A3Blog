class PostsController < ApplicationController

  before_action :signed_in_user, except: [:show, :index]

  #/posts
  def index
    if params[:search]
      params[:search] == "" ? @posts = Post.where(publish: true).paginate(page: params[:page], per_page: 30) : @posts = Post.search_by_title(params[:search]).where(publish: true).paginate(page: params[:page], per_page: 30)
    else
      case params[:filter]
      when 'Social'
        @posts = Post.social.paginate(page: params[:page], per_page: 30)
      when 'Actividades'
        @posts = Post.activities.paginate(page: params[:page], per_page: 30)
      when 'Tips'
        @posts = Post.tips.paginate(page: params[:page], per_page: 30)
      when 'Exito'
        @posts = Post.success.paginate(page: params[:page], per_page: 30)
      when 'Articulos'
        @posts = Post.articles.paginate(page: params[:page], per_page: 30)
      else
        @posts = Post.where(publish: true).paginate(page: params[:page], per_page: 30)
      end
    end
  end

  def show
    @post = Post.friendly.find(params[:id])
  end

  def edit
    @post = Post.friendly.find(params[:id])
    @post.increment!(:visits_count, 1) if !current_user
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    byebug
    if @post.save
      flash[:success] = "Artículo creado exitósamente"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @post = Post.friendly.find(params[:id])
    if @post.update_attributes(post_params)
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
    redirect_to root_path
  end

  def unpublished
    @posts = Post.all.where(publish: false).paginate(page: params[:page], per_page: 30)
  end

  def comments
    @post = Post.friendly.find(params[:id])
    comment = @post.comments.create
    comment.comment = params[:comment][:comment]
    comment.save
    redirect_to @post
  end

  private

    def post_params
      params.require(:post).permit(:title, :summary, :content, :avatar, :publish, 
        :tag_list, :category_list, :mother_category, :author)
    end

end
