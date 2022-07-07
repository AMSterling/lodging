Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/hotels', to: 'hotels#index'
  get '/hotels/:id', to: 'hotels#show'
  get 'hotels/:hotel_id/rooms', to: 'hotel_rooms#index'
end
