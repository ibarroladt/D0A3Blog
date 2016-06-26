Rails.application.routes.draw do

  get "/posts/unpublished", to: "posts#unpublished", as: 'unpublished'
  root 'static_pages#home'
  resources :users
  resources :posts
  patch '/posts/:id/comments', to: 'posts#comments', as: 'comments'
  resources :categories, only: [:index]
  get 'tags/:tag', to: 'categories#index', as: :tag
  resources :tags
  get    'new'     => 'sessions#new'
  post   'login'   => 'sessions#create'
  match '/logout', to: 'sessions#destroy',     via: 'delete'

end
