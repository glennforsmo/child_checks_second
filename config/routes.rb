Rails.application.routes.draw do

  root 'children#index'

  resources :children do
    resources :checkpoints, only: [:show, :create, :update, :destroy]
  end

end
