Rails.application.routes.draw do

  root 'children#index'

  resources :children do
    resources :checkpoints
  end

end
