Rails.application.routes.draw do
  # define root view
  root to: 'welcome#index'

  devise_for :users

  resources :courses do
    resources :cohorts
  end

  resources :instructors do
    resources :users
  end

  resources :admins do
    resources :users
  end

  resources :students

  resources :grades

end
