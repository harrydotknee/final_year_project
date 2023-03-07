Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  get 'workouts', to: 'workouts#index'
  post 'workouts', to: 'workouts#create'
  post 'workouts/:id', to: 'workouts#edit'
  get 'exercises', to: 'exercises_types#index'
end
