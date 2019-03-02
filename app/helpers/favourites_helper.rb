module FavouritesHelper
  def favourite?(post)
    puts current_user
    current = Favourite.find_by(user: current_user, post: post, favourite: true)
    current.present?
  end
end
