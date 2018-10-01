Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    #user homepage
    root 'welcome#home'
    get '/group', to: 'welcome#new'
    post '/group', to: 'welcome#create'

    #gifts
    #Cannot create gift with same name
    get '/wishlist', to: 'gifts#index'
    get '/gifts', to: 'gifts#new'
    post '/gifts', to: 'gifts#create'
    delete '/gifts/:id', to: 'gifts#destroy'

    # #wishlist
    # #If has wishlist cannot create a new one
    # get '/wishlist', to: 'gifts#new'
    # post '/wishlist', to: 'gifts#create'
    # #add edit wishlist
    # delete '/wishlist/:id', to: 'gifts#destroy'

    #User signup
    get '/signup', to: 'users#new'
    post '/signup', to: 'users#create'

    #sessions
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'

end
