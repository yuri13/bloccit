Rails.application.routes.draw do
  resources :topics do
# #pass resources :posts to the resources :topics block. nests the post routes
    resources :posts, except: [:index]
  end

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]
  
  # #remove welcome index, it has already been declared as the root view
  get 'about' => 'welcome#about'

  root 'welcome#index'

end
