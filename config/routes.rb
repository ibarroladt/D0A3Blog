Rails.application.routes.draw do

  get 'users/new'

  get 'users/edit'

  get 'users/show'

  get "/posts/unpublished", :to => "posts#unpublished", :as => 'unpublished'
  root 'static_pages#home'
  resources :posts
  resources :categories
  resources :posts_in_categories
  get 'tags/:tag', to: 'categories#index', as: :tag
  resources :tags

end
