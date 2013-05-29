Flashy::Application.routes.draw do
  
  match "/auth/:provider" => redirect("http://#{DOMAIN_NAME}/auth/#{:provider}"), :as => :signin
  match '/auth/:provider/callback' => 'sessions#create'
  match '/signout' => 'sessions#destroy', :as => :signout

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  # get "/decks" => 'decks#index'
  # get "/decks/new" => 'decks#new'
  # get "/decks/:id" => 'decks#show', as: :deck
  # post "/decks" => 'decks#create'
  # get "/decks/:id/edit" => 'decks#edit'
  # put "/decks/:id" => 'decks#update'
  # delete "/decks/:id" => 'decks#destroy'
  
  resources :decks do
    resources :cards, except: :index
  end
  
  root :to => "homes#index"

end
