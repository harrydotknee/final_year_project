Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  get 'workouts', to: 'workouts#index'
  post 'workouts', to: 'workouts#create'
  post 'workouts/:id', to: 'workouts#edit'
  delete 'workouts/:id', to: 'workouts#destroy'
  get 'exercises', to: 'exercise_types#index'
  post 'workouts/:id/share', to: 'workouts#share'
end
