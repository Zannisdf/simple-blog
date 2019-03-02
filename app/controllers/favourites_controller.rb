class FavouritesController < ApplicationController
  before_action :set_post

  def set_favourite
    current = Favourite.find_or_create_by(user: current_user, post: @post)
    current.favourite = !current.favourite
    if current.save
      respond_to :js
    else
      redirect_to root_path, alert: 'Ha ocurrido un error.'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
