Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "worktimes#index"
  resources :worktimes, only: [:index, :create, :show, :edit, :update]
  resources :holidays, only: [:new, :create, :show, :delete]
  post '/holidays/new' => 'holidays#new'
end
