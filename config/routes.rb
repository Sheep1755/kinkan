Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "worktimes#index"
  resources :worktimes, only: [:index, :create, :show]
  resources :holidays, only: [:new, :create]
  post '/holidays/new' => 'holidays#new'
end
