Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

<<<<<<< HEAD
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
=======
    resources :gifts
    resources :groups
    get '/add_user', to: 'groups#add_user'
    post '/add_user', to: 'groups#add_user_to_group'

    #sessions
    root 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
>>>>>>> 1e181042914eb314725dd47af8759e81d276531c

    #User signup
    get '/signup', to: 'users#new'
    post '/signup', to: 'users#create'
    get '/show', to: 'users#show'




    #user homepage
    # root 'welcome#home'
    #
    # get '/group', to: 'welcome#new'
    # post '/group', to: 'welcome#create'
    #
    # #gifts
    # #Cannot create gift with same name
    # get '/gifts', to: 'gifts#new'
    # post '/gifts', to: 'gifts#create'
    # delete '/gifts/:id', to: 'gifts#destroy'
    #
    # #wishlist
    # #If has wishlist cannot create a new one
    # get '/wishlist', to: 'gifts#new'
    # post '/wishlist', to: 'gifts#create'
    # #add edit wishlist
    # delete '/wishlist/:id', to: 'gifts#destroy'
    #
    #


end
