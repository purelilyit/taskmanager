Rails.application.routes.draw do
  resources :tasks
  # get '/tasks/new' => 'tasks#new'
  get '/completed' => 'tasks#done'
  # get '/tasks' => 'tasks#index'
  # get '/tasks/:id/edit' => 'tasks#edit', as: 'edit_task'
  root to: 'tasks#index'
end
