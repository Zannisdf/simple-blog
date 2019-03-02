Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    post 'favourite', to: 'favourites#set_favourite'
    resources :comments, only: :create
  end

  resources :comments, only: [] do
    resources :likes, only: :create
  end
  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
