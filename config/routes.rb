Rails.application.routes.draw do
  # #instructs Rails to create post routes for creating updating viewing deleting instances of Post
  resources :posts

  # #remove welcome index, it has already been declared as the root view
  get 'about' => 'welcome#about'

  root 'welcome#index'

end
