Rails.application.routes.draw do
  root to: 'articles#index'

  resources :articles do
    resources :comments
  end

  resources :tags, only: [:show, :index]

end
