Rails.application.routes.draw do

#  devise_for :users
  root 'children#index'

  resources :children do
    resources :checkpoints, only: [:show, :create, :update, :destroy]
  end

end
