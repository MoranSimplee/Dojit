Rails.application.routes.draw do
  devise_for :
  resources :users, only: [:update]
  resources :topics do
    resources :posts, except: [:index]
  end
  
  get 'about' => 'welcome#about'
  
  root to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
