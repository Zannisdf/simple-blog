class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.order('id DESC')
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

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
