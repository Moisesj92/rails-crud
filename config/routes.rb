Rails.application.routes.draw do
  resources :videos

  get 'courses', to: 'courses#index'
  get 'courses/new'
  get 'courses/:id', to: 'courses#show', as: 'show_course'
  get 'courses/:id/edit', to: 'courses#edit', as: 'edit_course'
  post 'courses', to: 'courses#create'
  patch 'courses/:id', to: 'courses#update', as: 'course'
  delete 'courses/:id', to: 'courses#destroy'

end
