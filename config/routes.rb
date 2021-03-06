Rails.application.routes.draw do
  resources :board_sprints do
  collection do
    patch :add_ticket
    patch :remove_ticket
  end
end
  resources :board_columns do
    collection do
      patch :sort
    end
  end


  resources :boards
  resources :ticket_comments
  resources :workflow_transitions
  resources :workflow_states
  resources :workflows
  resources :notifications
  resources :project_roles
  resources :tickets
  resources :projects
  resources :permissions
  root 'dashboards#show'

  get '/login',   to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  get '/logout',   to: 'sessions#destroy' 

  resources :users
  resources :groups
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
