Rails.application.routes.draw do

  get "/posts/unpublished", :to => "posts#unpublished", :as => 'unpublished'
  root 'static_pages#home'
  resources :posts
  resources :categories
  resources :posts_in_categories
  resources :tags, only: [:index, :show, :destroy]
end
