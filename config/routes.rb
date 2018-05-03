Rails.application.routes.draw do
  # define root view
  root 'cohorts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :courses do
    resources :cohorts
  end
  resources :instructors
  resources :students
  resources :profiles
  resources :users
end
