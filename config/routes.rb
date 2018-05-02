Rails.application.routes.draw do
  get 'users/index'
  get 'users/create'
  get 'users/show'
  get 'users/destroy'
  get 'users/update'
  get 'profiles/index'
  get 'profiles/update'
  get 'instructors/index'
  get 'instructors/create'
  get 'instructors/show'
  get 'instructors/edit'
  get 'instructors/destroy'
  get 'instructors/update'
  get 'students/index'
  get 'students/create'
  get 'students/show'
  get 'students/edit'
  get 'students/destroy'
  get 'students/update'
  get 'cohorts/index'
  get 'cohorts/create'
  get 'cohorts/show'
  get 'cohorts/edit'
  get 'cohorts/destroy'
  get 'cohorts/update'
  get 'courses/index'
  get 'courses/create'
  get 'courses/show'
  get 'courses/edit'
  get 'courses/destroy'
  get 'courses/update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :courses do
    resources :cohorts
  end
  resources :instructors
  resources :students
  resources :profiles
  resources :users
end
