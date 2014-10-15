Rails.application.routes.draw do
  resources :grubbers
  root 'grubbers#new'
end
