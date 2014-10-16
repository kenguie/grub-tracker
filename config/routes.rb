Rails.application.routes.draw do
  
  #post 'grubbers/message', to 'grubbers#message'
  post '/api/sms', to: 'twilio#sms'
  resources :grubbers do
    collection do
      post 'message'
    end
  end
  root 'grubbers#new'
end
