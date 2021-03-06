class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :check_permission, only: %i[update destroy]
  load_and_authorize_resource

  def index
    @posts = Post.order('id DESC')
  end

  def new
    @post = Post.new
    respond_to :js
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      respond_to :js
    else
      redirect_to root_path, alert: 'Ha ocurrido un error creando el post. Por favor inténtelo nuevamente.'
    end
  end

  def show
    @comments = @post.comments.order('id DESC')
    @comment = Comment.new
    respond_to :html
  end

  def edit
    respond_to :js
  end

  def update
    if @post.update(post_params)
      respond_to :js
    else
      redirect_to root_path, alert: 'Hubo un problema. Por favor inténtelo de nuevo.'
    end
  end

  def destroy
    @post.destroy
    respond_to :js
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def check_permission
    redirect_to root_path, alert: 'No posee los permisos necesarios.' and return unless @post.user == current_user
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
