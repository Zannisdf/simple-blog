module LikesHelper
  def liked?(comment)
    Like.find_by(user: current_user, comment: comment, liked: true).present?
  end
end
