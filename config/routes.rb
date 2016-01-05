Rails.application.routes.draw do

  get "/posts/unpublished", :to => "posts#unpublished", :as => 'unpublished'
  root 'static_pages#home'
  resources :posts
  
end
