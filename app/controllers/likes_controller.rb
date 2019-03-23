class LikesController < ApplicationController
  load_and_authorize_resource
  
  def create
    @like = Like.find_or_create_by(
      user: current_user,
      comment_id: params[:comment_id]
    )
    @like.liked = !@like.liked
    if @like.save
      respond_to :js
    else
      redirect_to root_path, alert: 'Ha ocurrido un error.'
    end
  end
end
