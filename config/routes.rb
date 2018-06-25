Rails.application.routes.draw do
  #get 'rooms/index'
  
  #get 'home/index'

  resources :rooms do 
    resources :messages
  end
  root 'home#index'

end
