class CommentsController < ApplicationController
  load_and_authorize_resource
  
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post_id = params[:post_id]
    if @comment.save
      respond_to :js
    else
      redirect_to root_path, alert: 'Ha ocurrido un error, inténtelo de nuevo.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
