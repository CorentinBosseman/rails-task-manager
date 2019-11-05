Rails.application.routes.draw do
  root to: 'tasks#index' # always the first one

  # READ ALL
  get 'tasks', to: 'tasks#index', as: 'index'


  # CREATE
  get 'tasks/new', to: 'tasks#new', as: 'new_task'
  post 'tasks', to: 'tasks#create'

  # READ
  get 'tasks/:id', to: 'tasks#show', as: 'task'

  # UPDATE
  get 'tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
  patch 'tasks/:id', to: 'tasks#update'

  # DELETE
  delete 'tasks/:id', to: 'tasks#destroy'
end
