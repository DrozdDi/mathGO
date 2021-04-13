Rails.application.routes.draw do
  resources :players
  resources :battles
  
  get 'battles/new'
  get 'battles/[:id]'

  root 'battles#new'
end
