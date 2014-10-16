Rails.application.routes.draw do
  
  #post 'grubbers/message', to 'grubbers#message'
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
