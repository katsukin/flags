Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/auth/:provider/callback' => 'sessions#create'

  resources :posts do
    resources :comments
  end

  resources :drafts
  resources :bottles

  root 'posts#index'


end
