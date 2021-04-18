Rails.application.routes.draw do
  resources :posts
  resources :tasks
  resources :completed_tasks
  # get '/tasks/new' => 'tasks#new'
  get '/completed' => 'completed_tasks#index'
  get '/done/:id' => 'tasks#done', as: 'done_task'
  # get '/tasks' => 'tasks#index'
  # get '/tasks/:id/edit' => 'tasks#edit', as: 'edit_task'
  root to: 'tasks#index'
end
