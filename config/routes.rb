Rails.application.routes.draw do


  root to: 'home#top'
  get '/about' => 'home#about', as: 'about'


  devise_for :admins, contorollers: {
  	sessions: 'admins/sessions',
  	passwords: 'admins/passwords',
  	registrations: 'admins/registrations'
  }

  namespace :admins do
    resources :categories
    resources :lessons
    resources :ranks
    resources :users, only: [:index, :show, :destroy]
  end


  devise_for :users, controllers: {
  	sessions: 'users/sessions',
  	passwords: 'users/passwords',
  	registrations: 'users/registrations'
  }

  	resources :attends, only: [:create, :index]
  	resources :lessons, only: [:index, :show] do
      get 'slide', on: :member
      get 'search', on: :collection
    end
    resources :users, only: [:show, :edit, :update] do
      get 'top', on: :collection
    end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
