Rails.application.routes.draw do

  get '/mechanics', to: 'mechanics#index'

  get '/parks/:id', to: 'parks#show'
end
