Rails.application.routes.draw do
  root 'page#index'
  resources :curriculums
  resources :students
  resources :cohorts
  resources :teachers
  resources :schools do
    resources :enrollments
  end

  patch 'students/:id/transfer', to: 'students#transfer', as: 'student_transfer'
end
