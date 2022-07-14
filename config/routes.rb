Rails.application.routes.draw do

  get '/hotels', to: 'hotels#index'
  get '/hotels/new', to: 'hotels#new'
  post '/hotels', to: 'hotels#create'
  get '/hotels/:id/edit', to: 'hotels#edit'
  patch '/hotels/:id', to: 'hotels#update'
  get '/hotels/:id', to: 'hotels#show'
  delete '/hotels/:id' , to: 'hotels#destroy'
  get '/rooms', to: 'rooms#index'
  get '/hotels/:hotel_id/new', to: 'hotel_rooms#new'
  post '/hotels/:hotel_id', to: 'hotel_rooms#create'
  get '/rooms/:id/edit', to: 'rooms#edit'
  patch '/rooms/:id', to: 'rooms#update'
  delete '/rooms/:id', to: 'rooms#destroy'
  get '/rooms/:id', to: 'rooms#show'
  get '/hotels/:hotel_id/rooms', to: 'hotel_rooms#index'
  get '/hotels/:hotel_id/rooms/new', to: 'hotel_rooms#new'
end
