Rails.application.routes.draw do
  get 'lists/index'
  get 'lists/show'
  get 'lists/new'
  get 'lists/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists, only: %i[index show new create]
  end
