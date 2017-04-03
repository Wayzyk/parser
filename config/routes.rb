Rails.application.routes.draw do
  root 'pages#index'

  namespace :api do
    resources :pages, only:[:index, :show]
  end
end
