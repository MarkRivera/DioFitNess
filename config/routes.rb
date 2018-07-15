Rails.application.routes.draw do
  resources :blogs, path: 'blog'
  root 'pages#index'
  get 'about', to: 'pages#about'
end
