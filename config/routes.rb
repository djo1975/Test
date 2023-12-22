Rails.application.routes.draw do
  root 'home#index'
  get 'search/create'
  post '/search', to: 'home#search'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
  # Defines the root path route ("/")
  # root "articles#index"
end
