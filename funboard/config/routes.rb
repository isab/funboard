Rails.application.routes.draw do
  resources :funposts
  root 'funposts#index'

  get 'tags/:tag', to: 'funposts#index', as: "tag"
end
