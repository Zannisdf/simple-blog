module FavouritesHelper
  def favourite?(post)
    Favourite.find_by(user: current_user, post: post, favourite: true).present?
  end
end
