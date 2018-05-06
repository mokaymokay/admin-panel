Rails.application.routes.draw do
  # define root view
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :courses do
    resources :cohorts
  end

  resources :instructors do
    resources :profiles
  end

  resources :admins do
    resources :profiles
  end

  resources :students

end
