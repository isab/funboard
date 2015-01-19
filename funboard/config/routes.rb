Rails.application.routes.draw do
  resources :funposts
  root 'funposts#index'
end
