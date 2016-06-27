Rails.application.routes.draw do


  
  root 'static#index', as: 'home'


  resources :users do
    resources :posts
  end


  get 'sign_up', to: 'users#new', as: :sign_in

  get 'new_user_post', to: 'posts#new'
  get 'edit_user_post', to: 'posts#edit'


  get 'sign_in', to: 'sessions#new'
  delete 'sign_out', to: 'sessions#destroy'


  resources :sessions, only:[:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


