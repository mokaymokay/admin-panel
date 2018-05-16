Rails.application.routes.draw do

  # root route if signed in
  authenticated do
    root 'welcome#index', as: :authenticated_root
  end

  # default root route
  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  # rename paths
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}

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
