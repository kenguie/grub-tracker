Rails.application.routes.draw do
  
  get 'signin', to: 'sessions#new'
  post 'sessions', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  post '/api/sms', to: 'twilio#sms'
  get '/message', to: 'grubbers#alert'
  get '/sent', to: 'grubbers#sent'
 
  resources :grubbers, except: :index do
    collection do
      post 'message'
    end
  end
  root 'grubbers#new'
end
