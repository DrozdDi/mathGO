Rails.application.routes.draw do
  resources :players
  resources :battles
  
  get 'battles/new'

  root 'battles#new'
end
