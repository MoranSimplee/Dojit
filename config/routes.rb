Rails.application.routes.draw do
  get 'comments/create'

  devise_for :users
  resources :users, only: [:update]

  resources :topics do
    resources :posts, except: [:index] do
      resources :comments, only: [:create, :new]
    end
  end
  
  get 'about' => 'welcome#about'
  
  root to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
