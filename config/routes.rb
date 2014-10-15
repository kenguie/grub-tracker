Rails.application.routes.draw do
  
  #post 'grubbers/message', to 'grubbers#message'

  resources :grubbers do
    collection do
      post 'message'
    end
  end
  root 'grubbers#new'
end
